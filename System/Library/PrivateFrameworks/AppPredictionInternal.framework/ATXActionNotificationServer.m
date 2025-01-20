@interface ATXActionNotificationServer
+ (ATXActionNotificationServer)sharedInstance;
+ (id)_requestIdentifierForBundleId:(id)a3;
+ (id)bundleIdFromRequestIdentifier:(id)a3;
+ (id)localizedContentBodyStringWithString:(id)a3 forAction:(id)a4;
- (ATXActionNotificationServer)init;
- (BOOL)_isRTL;
- (BOOL)hasLockscreenPrediction;
- (id)_actionKeyFromNotification:(id)a3;
- (id)_blendingCacheUpdateUUIDFromNotification:(id)a3;
- (id)_localizedStringForKey:(id)a3 defaultValue:(id)a4 languageCode:(id)a5;
- (id)_unarchiveProactiveSuggestionFromNotification:(id)a3;
- (id)proactiveSuggestionsCurrentlyOnLockscreen;
- (unint64_t)deliveredNotificationCount;
- (void)_postNotificationForProactiveSuggestion:(id)a3 blendingCacheUpdateUUID:(id)a4;
- (void)_postTestNotification;
- (void)_postTestNotificationWithPredictionCount:(int64_t)a3;
- (void)_removeNotificationWithIdentifier:(id)a3 trackEvent:(BOOL)a4;
- (void)_sendLockscreenEventToBiomeWithDate:(id)a3 eventType:(int)a4 blendingCacheId:(id)a5 suggestionIds:(id)a6;
- (void)_setupNotifications;
- (void)postDemoOrDebugNotificationForATXAction:(id)a3;
- (void)postNotificationForATXAction:(id)a3;
- (void)postNotificationForProactiveSuggestion:(id)a3 blendingCacheUpdateUUID:(id)a4;
- (void)removeActionPredictionNotificationsMatchingAction:(id)a3;
- (void)removeAllActionPredictionNotificationsAndTrackEvent:(BOOL)a3 recordFeedback:(BOOL)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4;
@end

@implementation ATXActionNotificationServer

+ (ATXActionNotificationServer)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1) {
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_216);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return (ATXActionNotificationServer *)v2;
}

uint64_t __45__ATXActionNotificationServer_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ATXActionNotificationServer);
  uint64_t v1 = sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_requestIdentifierForBundleId:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = NSString;
    v5 = [MEMORY[0x1E4F29128] UUID];
    v6 = [v5 UUIDString];
    v7 = [v4 stringWithFormat:@"%@|%@", v3, v6];
  }
  else
  {
    v5 = [MEMORY[0x1E4F29128] UUID];
    v7 = [v5 UUIDString];
  }

  return v7;
}

+ (id)bundleIdFromRequestIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"|"];
  if ((unint64_t)[v3 count] < 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = [v3 objectAtIndexedSubscript:0];
  }

  return v4;
}

+ (id)localizedContentBodyStringWithString:(id)a3 forAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 routeInfo];
  if (v7
    && (v8 = (void *)v7,
        [v6 routeInfo],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isExternalRoute],
        v9,
        v8,
        v10))
  {
    id v11 = [NSString alloc];
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"AirPlay to %@" value:&stru_1F2740B58 table:0];
    v14 = [v6 routeInfo];
    v15 = [v14 deviceName];
    v16 = objc_msgSend(v11, "initWithFormat:", v13, v15);

    if ([v5 length])
    {
      v17 = [NSString localizedUserNotificationStringForKey:v5 arguments:0];
      id v18 = (id)[[NSString alloc] initWithFormat:@"%@\n%@", v17, v16];
    }
    else
    {
      id v18 = v16;
    }
  }
  else
  {
    if ([v5 length])
    {
      id v19 = [NSString localizedUserNotificationStringForKey:v5 arguments:0];
    }
    else
    {
      id v19 = v5;
    }
    id v18 = v19;
  }

  return v18;
}

- (ATXActionNotificationServer)init
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)ATXActionNotificationServer;
  v2 = [(ATXActionNotificationServer *)&v29 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.Siri.ActionPredictionNotifications"];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v3;

    [(UNUserNotificationCenter *)v2->_notificationCenter setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_notificationCenter setWantsNotificationResponsesDelivered];
    id v5 = v2->_notificationCenter;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __35__ATXActionNotificationServer_init__block_invoke;
    v27[3] = &unk_1E68B53A0;
    id v6 = v2;
    v28 = v6;
    [(UNUserNotificationCenter *)v5 requestAuthorizationWithOptions:4 completionHandler:v27];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)onPostTestNotifReceive, @"com.apple.Siri.TestActionNotification", 0, CFNotificationSuspensionBehaviorDrop);
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, v6, (CFNotificationCallback)onPostTestNotifReceiveNoPrediction, @"com.apple.Siri.TestActionNotificationNoPrediction", 0, CFNotificationSuspensionBehaviorDrop);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v6, (CFNotificationCallback)onPostTestNotifReceiveManyPredictions, @"com.apple.Siri.TestActionNotificationManyPredictions", 0, CFNotificationSuspensionBehaviorDrop);
    int v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v10, v6, (CFNotificationCallback)onPostTestNotifRemoveAll, @"com.apple.Siri.TestActionNotificationRemoveAll", 0, CFNotificationSuspensionBehaviorDrop);
    id v11 = objc_alloc(MEMORY[0x1E4F93738]);
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
    uint64_t v13 = [v11 initWithFeatureId:@"ActionPredictions" event:@"remove_notif" registerProperties:MEMORY[0x1E4F1CBF0]];
    removeTracker = v6->_removeTracker;
    v6->_removeTracker = (PETScalarEventTracker *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"ActionPredictions" event:@"post_notif_init" registerProperties:v12];
    notifyInitTracker = v6->_notifyInitTracker;
    v6->_notifyInitTracker = (PETScalarEventTracker *)v15;

    v17 = [MEMORY[0x1E4F93720] propertyWithName:@"reason" possibleValues:&unk_1F27F38D0];
    id v18 = objc_alloc(MEMORY[0x1E4F93738]);
    v30[0] = v17;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    uint64_t v20 = [v18 initWithFeatureId:@"ActionPredictions" event:@"post_notif_error" registerProperties:v19];
    notifyErrorTracker = v6->_notifyErrorTracker;
    v6->_notifyErrorTracker = (PETScalarEventTracker *)v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"ActionPredictions" event:@"post_notif_success" registerProperties:v12];
    notifySuccessTracker = v6->_notifySuccessTracker;
    v6->_notifySuccessTracker = (PETScalarEventTracker *)v22;

    uint64_t v24 = [MEMORY[0x1E4F4B018] sharedInstance];
    engagementRecordManager = v6->_engagementRecordManager;
    v6->_engagementRecordManager = (ATXEngagementRecordManager *)v24;
  }
  return v2;
}

void __35__ATXActionNotificationServer_init__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = __atxlog_handle_notifications();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_INFO, "Notification Center access granted!", v8, 2u);
    }

    [*(id *)(a1 + 32) _setupNotifications];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __35__ATXActionNotificationServer_init__block_invoke_cold_1();
    }
  }
}

- (void)_setupNotifications
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F445A0]) initWithIdentifier:@"suggestedShortcut"];
  [v5 setBackgroundStyle:1];
  [v5 setHiddenPreviewsBodyPlaceholder:@" "];
  [v5 setListPriority:2];
  [v5 setOptions:131073];
  notificationCenter = self->_notificationCenter;
  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v5, 0);
  [(UNUserNotificationCenter *)notificationCenter setNotificationCategories:v4];
}

- (void)_postTestNotification
{
}

- (void)_postTestNotificationWithPredictionCount:(int64_t)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = __atxlog_handle_notifications();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v45 = a3;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "Posting %ld test notification(s)", buf, 0xCu);
  }

  if (a3 >= 1)
  {
    buf[0] = 0;
    if (CFPreferencesGetAppBooleanValue(@"displayLastDonationOnCoverSheet", (CFStringRef)*MEMORY[0x1E4F4B688], buf))
    {
      id v6 = [MEMORY[0x1E4F4AE68] actionResponseForDeveloperMode];
      uint64_t v7 = [v6 scoredActions];
      if (!v7)
      {
        v8 = [v6 proactiveSuggestions];

        if (v8)
        {
          int64_t v31 = a3;
          id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
          int v10 = [v6 proactiveSuggestions];
          v33 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          obuint64_t j = [v6 proactiveSuggestions];
          uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v39;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v39 != v13) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                id v16 = objc_alloc(MEMORY[0x1E4F4B2B0]);
                v17 = [v15 atxActionExecutableObject];
                id v18 = [v15 scoreSpecification];
                [v18 rawScore];
                *(float *)&double v19 = v19;
                uint64_t v20 = (void *)[v16 initWithPredictedItem:v17 score:v19];

                if (v20) {
                  [v33 addObject:v20];
                }
              }
              uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
            }
            while (v12);
          }

          uint64_t v7 = (void *)[v33 copy];
          a3 = v31;
        }
        else
        {
          uint64_t v7 = 0;
        }
      }
      unint64_t v24 = [v7 count];
      if (v24 >= a3) {
        int64_t v25 = a3;
      }
      else {
        int64_t v25 = v24;
      }
      uint64_t v22 = objc_msgSend(v7, "subarrayWithRange:", 0, v25);
    }
    else
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F4AE50]);
      v21 = [v6 actionPredictionsForConsumerSubType:21 limit:a3];
      if (!v21)
      {
        v23 = 0;
        goto LABEL_34;
      }
      uint64_t v7 = v21;
      uint64_t v22 = [v21 scoredActions];
    }
    v23 = (void *)v22;

    if (![v23 count])
    {
LABEL_35:

      return;
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = v23;
    uint64_t v26 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v6);
          }
          v30 = [*(id *)(*((void *)&v34 + 1) + 8 * j) predictedItem];
          [(ATXActionNotificationServer *)self postDemoOrDebugNotificationForATXAction:v30];
        }
        uint64_t v27 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v27);
    }
    v23 = v6;
LABEL_34:

    goto LABEL_35;
  }
}

- (void)postNotificationForATXAction:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PETScalarEventTracker *)self->_notifyInitTracker trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0]];
  if ([(ATXActionNotificationServer *)self hasLockscreenPrediction])
  {
    id v5 = __atxlog_handle_notifications();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Trying to predict action %@", (uint8_t *)&v7, 0xCu);
    }

    id v6 = __atxlog_handle_notifications();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXActionNotificationServer postNotificationForATXAction:]();
    }

    [(ATXActionNotificationServer *)self removeAllActionPredictionNotificationsAndTrackEvent:0 recordFeedback:0];
  }
  [(ATXActionNotificationServer *)self postDemoOrDebugNotificationForATXAction:v4];
}

- (void)postDemoOrDebugNotificationForATXAction:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F93940];
  id v5 = a3;
  id v6 = [v4 clientModelIdFromClientModelType:25];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v6 clientModelVersion:@"1.0"];
  id v8 = objc_alloc(MEMORY[0x1E4F4B2B0]);
  LODWORD(v9) = 1.0;
  int v10 = (void *)[v8 initWithPredictedItem:v5 score:v9];

  v14[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v12 = +[ATXProactiveSuggestionBuilder proactiveSuggestionsForLockscreenActions:v11 clientModelSpec:v7];
  uint64_t v13 = [v12 firstObject];

  [(ATXActionNotificationServer *)self _postNotificationForProactiveSuggestion:v13 blendingCacheUpdateUUID:0];
}

- (unint64_t)deliveredNotificationCount
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  notificationCenter = self->_notificationCenter;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke;
  v9[3] = &unk_1E68B53C8;
  uint64_t v11 = &v12;
  id v5 = v3;
  int v10 = v5;
  [(UNUserNotificationCenter *)notificationCenter getDeliveredNotificationsWithCompletionHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke_2;
  v8[3] = &unk_1E68AB438;
  v8[4] = &v12;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v5 timeoutSeconds:&__block_literal_global_183 onAcquire:v8 onTimeout:1.0];
  unint64_t v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v15 = a1;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v10 = __atxlog_handle_notifications();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [v9 request];
          uint64_t v12 = [v11 identifier];
          uint64_t v13 = [v9 request];
          uint64_t v14 = [v13 content];
          *(_DWORD *)buf = 138412546;
          v21 = v12;
          __int16 v22 = 2112;
          v23 = v14;
          _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Notification with id: %@, content: %@", buf, 0x16u);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v15 + 32));
}

void __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v1 = __atxlog_handle_notifications();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke_2_cold_1();
  }
}

- (id)proactiveSuggestionsCurrentlyOnLockscreen
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__98;
  uint64_t v15 = __Block_byref_object_dispose__98;
  id v16 = (id)objc_opt_new();
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  notificationCenter = self->_notificationCenter;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__ATXActionNotificationServer_proactiveSuggestionsCurrentlyOnLockscreen__block_invoke;
  v8[3] = &unk_1E68B53F0;
  v8[4] = self;
  int v10 = &v11;
  uint64_t v5 = v3;
  double v9 = v5;
  [(UNUserNotificationCenter *)notificationCenter getDeliveredNotificationsWithCompletionHandler:v8];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v5 timeoutSeconds:&__block_literal_global_185 onAcquire:&__block_literal_global_187 onTimeout:1.0];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __72__ATXActionNotificationServer_proactiveSuggestionsCurrentlyOnLockscreen__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(a1 + 32) _unarchiveProactiveSuggestionFromNotification:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        if (v8) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __72__ATXActionNotificationServer_proactiveSuggestionsCurrentlyOnLockscreen__block_invoke_3()
{
  v0 = __atxlog_handle_notifications();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __72__ATXActionNotificationServer_proactiveSuggestionsCurrentlyOnLockscreen__block_invoke_3_cold_1();
  }
}

- (BOOL)hasLockscreenPrediction
{
  return [(ATXActionNotificationServer *)self deliveredNotificationCount] != 0;
}

- (void)postNotificationForProactiveSuggestion:(id)a3 blendingCacheUpdateUUID:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PETScalarEventTracker *)self->_notifyInitTracker trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0]];
  if ([(ATXActionNotificationServer *)self hasLockscreenPrediction])
  {
    id v8 = __atxlog_handle_notifications();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Trying to predict suggestion %@", (uint8_t *)&v10, 0xCu);
    }

    long long v9 = __atxlog_handle_notifications();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXActionNotificationServer postNotificationForATXAction:]();
    }

    [(ATXActionNotificationServer *)self removeAllActionPredictionNotificationsAndTrackEvent:0 recordFeedback:0];
  }
  [(ATXActionNotificationServer *)self _postNotificationForProactiveSuggestion:v6 blendingCacheUpdateUUID:v7];
}

- (void)_postNotificationForProactiveSuggestion:(id)a3 blendingCacheUpdateUUID:(id)a4
{
  v71[3] = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v58 = a4;
  id v7 = __atxlog_handle_blending();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    long long v9 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v65 = v9;
    __int16 v66 = 2112;
    v67 = v6;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%@ - attempting to post notification for suggestion: %@", buf, 0x16u);
  }
  int v10 = [(__CFString *)v6 atxActionExecutableObject];
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 actionTitle];
    uint64_t v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v57 = [v12 stringByTrimmingCharactersInSet:v13];

    uint64_t v14 = [v11 actionSubtitle];
    uint64_t v15 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v56 = [v14 stringByTrimmingCharactersInSet:v15];

    id v16 = [v11 _bundleIdForDisplay];
    if (v16)
    {
      if ([v57 length] || objc_msgSend(v56, "length"))
      {
        if ([v16 isEqualToString:@"com.apple.mobilenotes"]
          && ([v11 isHeuristic] & 1) == 0)
        {

          v56 = 0;
        }
        v55 = [(__CFString *)v6 encodeAsProto];
        v54 = [v11 actionKey];
        if (v55 && v54)
        {
          v70[0] = @"actionKey";
          v70[1] = @"proactiveSuggestion";
          v71[0] = v54;
          v71[1] = v55;
          v70[2] = @"blendingCacheUpdateUUID";
          uint64_t v17 = [v58 UUIDString];
          long long v18 = (void *)v17;
          long long v19 = &stru_1F2740B58;
          if (v17) {
            long long v19 = (__CFString *)v17;
          }
          v71[2] = v19;
          v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:3];

          uint64_t v20 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F445B0]);
          [(__CFString *)v20 setShouldSuppressScreenLightUp:1];
          [(__CFString *)v20 setUserInfo:v52];
          [(__CFString *)v20 setShouldHideDate:1];
          [(__CFString *)v20 setSound:0];
          [(__CFString *)v20 setShouldAuthenticateDefaultAction:1];
          if ([v16 length])
          {
            v21 = [v11 bundleId];
            __int16 v22 = [v11 userActivityWebpageURL];
            uint64_t v23 = ATXBundleIdReplacementForBundleIdWithWebpageURLHint();

            id v16 = (void *)v23;
          }
          unint64_t v24 = [NSString localizedUserNotificationStringForKey:v57 arguments:0];
          [(__CFString *)v20 setTitle:v24];

          uint64_t v25 = +[ATXActionNotificationServer localizedContentBodyStringWithString:v56 forAction:v11];
          [(__CFString *)v20 setBody:v25];

          uint64_t v26 = __atxlog_handle_notifications();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = [(__CFString *)v20 title];
            uint64_t v28 = [(__CFString *)v20 body];
            *(_DWORD *)buf = 138412546;
            v65 = v27;
            __int16 v66 = 2112;
            v67 = v28;
            _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "UNMutableNotificationContent content title: %@, body: %@", buf, 0x16u);
          }
          objc_super v29 = [v11 intent];
          v53 = [v29 _className];

          if ([v53 isEqualToString:@"DNDToggleDoNotDisturbIntent"])
          {
            uint64_t v49 = [MEMORY[0x1E4F44610] iconNamed:@"dnd-notif-icon"];
            -[__CFString setIcon:](v20, "setIcon:", v49, v49);
          }
          else
          {
            if ([v53 isEqualToString:@"WFSetAirplaneModeIntent"]) {
              [MEMORY[0x1E4F44610] iconNamed:@"airplane-notif-icon"];
            }
            else {
            uint64_t v51 = [MEMORY[0x1E4F44610] iconForApplicationIdentifier:v16];
            }
            -[__CFString setIcon:](v20, "setIcon:", v51, v51);
          }
          long long v34 = [(ATXActionNotificationServer *)self _localizedStringForKey:@"ATXNotificationFooter" defaultValue:@"ATXNotificationFooter" languageCode:0];
          [(__CFString *)v20 setFooter:v34];

          long long v35 = [v11 intent];
          int v36 = objc_msgSend(v35, "atx_supportsBackgroundExecution");

          if (v36
            && (([MEMORY[0x1E4F93B08] isAudioAccessory] & 1) != 0
             || ![v11 isTVWhiteListedLongFormMedia]))
          {
            [(__CFString *)v20 setShouldBackgroundDefaultAction:1];
            [(__CFString *)v20 setShouldPreventNotificationDismissalAfterDefaultAction:1];
          }
          else
          {
            [(__CFString *)v20 setShouldBackgroundDefaultAction:1];
          }
          [(__CFString *)v20 setCategoryIdentifier:@"suggestedShortcut"];
          long long v37 = __atxlog_handle_notifications();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v65 = "-[ATXActionNotificationServer _postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:]";
            __int16 v66 = 2112;
            v67 = v20;
            _os_log_impl(&dword_1D0FA3000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s posting content: %@", buf, 0x16u);
          }

          long long v38 = [v11 intent];
          long long v39 = objc_msgSend(v38, "_intents_bundleIdForDisplay");
          long long v40 = v39;
          if (v39)
          {
            id v41 = v39;
          }
          else
          {
            id v41 = [v11 bundleId];
          }
          v42 = v41;

          v43 = [(id)objc_opt_class() _requestIdentifierForBundleId:v42];
          v44 = [MEMORY[0x1E4F44628] requestWithIdentifier:v43 content:v20 trigger:0 destinations:6];
          int64_t v45 = __atxlog_handle_notifications();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v46 = [v44 identifier];
            *(_DWORD *)buf = 138412290;
            v65 = v46;
            _os_log_impl(&dword_1D0FA3000, v45, OS_LOG_TYPE_DEFAULT, "posting notification req id: %@", buf, 0xCu);
          }
          objc_initWeak((id *)buf, self);
          notificationCenter = self->_notificationCenter;
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __95__ATXActionNotificationServer__postNotificationForProactiveSuggestion_blendingCacheUpdateUUID___block_invoke;
          v59[3] = &unk_1E68B5418;
          objc_copyWeak(&v63, (id *)buf);
          id v60 = v11;
          v61 = v6;
          id v62 = v58;
          [(UNUserNotificationCenter *)notificationCenter addNotificationRequest:v44 withCompletionHandler:v59];

          objc_destroyWeak(&v63);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          v32 = __atxlog_handle_ui();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          {
            v48 = @"nil";
            *(_DWORD *)buf = 138412802;
            v65 = v54;
            __int16 v66 = 2112;
            if (v55) {
              v48 = @"not nil";
            }
            v67 = v48;
            __int16 v68 = 2112;
            v69 = v6;
            _os_log_fault_impl(&dword_1D0FA3000, v32, OS_LOG_TYPE_FAULT, "not posting notification for actionKey: %@, proactiveSuggestionData: %@, suggestion: %@", buf, 0x20u);
          }

          [(PETScalarEventTracker *)self->_notifyErrorTracker trackEventWithPropertyValues:&unk_1F27F3930];
        }
      }
      else
      {
        v33 = __atxlog_handle_notifications();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[ATXActionNotificationServer _postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:]();
        }

        [(PETScalarEventTracker *)self->_notifyErrorTracker trackEventWithPropertyValues:&unk_1F27F3918];
      }
    }
    else
    {
      int64_t v31 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[ATXActionNotificationServer _postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:]();
      }

      [(PETScalarEventTracker *)self->_notifyErrorTracker trackEventWithPropertyValues:&unk_1F27F3900];
    }
  }
  else
  {
    v30 = __atxlog_handle_notifications();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[ATXActionNotificationServer _postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:]();
    }

    [(PETScalarEventTracker *)self->_notifyErrorTracker trackEventWithPropertyValues:&unk_1F27F38E8];
  }
}

void __95__ATXActionNotificationServer__postNotificationForProactiveSuggestion_blendingCacheUpdateUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = __atxlog_handle_notifications();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __95__ATXActionNotificationServer__postNotificationForProactiveSuggestion_blendingCacheUpdateUUID___block_invoke_cold_1();
    }

    id v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      long long v9 = NSStringFromClass(v8);
      int v10 = [*(id *)(a1 + 32) actionKey];
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      uint64_t v25 = v10;
      __int16 v26 = 2112;
      id v27 = v3;
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%@ - failed to post notification with actionKey: %@, error: %@, suggestion: %@", buf, 0x2Au);
    }
    if (WeakRetained) {
      [WeakRetained[5] trackEventWithPropertyValues:&unk_1F27F3948];
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "notif success", buf, 2u);
    }

    uint64_t v12 = __atxlog_handle_blending();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = [*(id *)(a1 + 32) actionKey];
      id v16 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%@ - posted notification with actionKey: %@, suggestion: %@", buf, 0x20u);
    }
    if (WeakRetained) {
      [WeakRetained[6] trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0]];
    }
    uint64_t v17 = objc_opt_new();
    uint64_t v18 = *(void *)(a1 + 48);
    long long v19 = [*(id *)(a1 + 40) uuid];
    v21 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [WeakRetained _sendLockscreenEventToBiomeWithDate:v17 eventType:1 blendingCacheId:v18 suggestionIds:v20];
  }
}

- (void)removeActionPredictionNotificationsMatchingAction:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  notificationCenter = self->_notificationCenter;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__ATXActionNotificationServer_removeActionPredictionNotificationsMatchingAction___block_invoke;
  v10[3] = &unk_1E68B5440;
  objc_copyWeak(&v13, &location);
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  id v8 = v5;
  uint64_t v12 = v8;
  [(UNUserNotificationCenter *)notificationCenter getDeliveredNotificationsWithCompletionHandler:v10];
  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v8 timeoutSeconds:2.0] == 1)
  {
    long long v9 = __atxlog_handle_notifications();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXActionNotificationServer removeActionPredictionNotificationsMatchingAction:]();
    }
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __81__ATXActionNotificationServer_removeActionPredictionNotificationsMatchingAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  __int16 v22 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
  id v21 = v4;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v10 = [*(id *)(a1 + 32) _actionKeyFromNotification:v9];
        uint64_t v11 = [*(id *)(a1 + 40) actionKey];
        uint64_t v12 = (void *)v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13 && [v10 isEqualToString:v11])
        {
          uint64_t v14 = [*(id *)(a1 + 32) _unarchiveProactiveSuggestionFromNotification:v9];
          uint64_t v15 = [v14 atxActionExecutableObject];
          if (v15
            && +[_ATXActionUtils isContainmentBetweenAction:v15 other:*(void *)(a1 + 40)])
          {
            id v16 = [v9 request];
            uint64_t v17 = [v16 identifier];
            [v22 addObject:v17];

            id v4 = v21;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v6);
  }

  if ([v22 count]) {
    [WeakRetained[1] removeDeliveredNotificationsWithIdentifiers:v22];
  }
  uint64_t v18 = __atxlog_handle_notifications();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = [*(id *)(a1 + 40) actionKey];
    *(_DWORD *)buf = 138412546;
    __int16 v28 = v22;
    __int16 v29 = 2112;
    uint64_t v30 = v19;
    _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "Removed delivered notifications: %@ matching action: %@", buf, 0x16u);

    id v4 = v21;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)removeAllActionPredictionNotificationsAndTrackEvent:(BOOL)a3 recordFeedback:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v5;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "removing all lockscreen predictions with trackEvent: %{BOOL}d and recordFeedback: %{BOOL}d", (uint8_t *)&buf, 0xEu);
  }

  if (v5) {
    [(PETScalarEventTracker *)self->_removeTracker trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0]];
  }
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  objc_initWeak(&buf, self);
  notificationCenter = self->_notificationCenter;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __98__ATXActionNotificationServer_removeAllActionPredictionNotificationsAndTrackEvent_recordFeedback___block_invoke;
  uint64_t v15 = &unk_1E68B5468;
  objc_copyWeak(&v18, &buf);
  BOOL v19 = v4;
  id v16 = self;
  int v10 = v8;
  uint64_t v17 = v10;
  [(UNUserNotificationCenter *)notificationCenter getDeliveredNotificationsWithCompletionHandler:&v12];
  if (objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:timeoutSeconds:", v10, 2.0, v12, v13, v14, v15, v16) == 1)
  {
    uint64_t v11 = __atxlog_handle_notifications();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXActionNotificationServer removeActionPredictionNotificationsMatchingAction:]();
    }
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&buf);
}

void __98__ATXActionNotificationServer_removeAllActionPredictionNotificationsAndTrackEvent_recordFeedback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v5 = WeakRetained;
  if (*(unsigned char *)(a1 + 56))
  {
    __int16 v21 = WeakRetained;
    id v22 = v3;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obuint64_t j = v3;
    uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v11 = [*(id *)(a1 + 32) _unarchiveProactiveSuggestionFromNotification:v10];
          uint64_t v12 = [*(id *)(a1 + 32) _blendingCacheUpdateUUIDFromNotification:v10];
          uint64_t v13 = (void *)v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14)
          {
            uint64_t v15 = *(void **)(a1 + 32);
            id v16 = objc_opt_new();
            uint64_t v17 = [v11 uuid];
            uint64_t v30 = v17;
            id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
            [v15 _sendLockscreenEventToBiomeWithDate:v16 eventType:4 blendingCacheId:v13 suggestionIds:v18];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
      }
      while (v7);
    }

    BOOL v5 = v21;
    id v3 = v22;
  }
  [v5[1] removeAllDeliveredNotifications];
  BOOL v19 = __atxlog_handle_notifications();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [v3 count];
    *(_DWORD *)id buf = 134217984;
    uint64_t v29 = v20;
    _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "Removed all delivered notifications: %ld", buf, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_removeNotificationWithIdentifier:(id)a3 trackEvent:(BOOL)a4
{
  BOOL v4 = a4;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4) {
    [(PETScalarEventTracker *)self->_removeTracker trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0]];
  }
  notificationCenter = self->_notificationCenter;
  v12[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(UNUserNotificationCenter *)notificationCenter removeDeliveredNotificationsWithIdentifiers:v8];

  long long v9 = __atxlog_handle_notifications();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Removed notification with identifier: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_sendLockscreenEventToBiomeWithDate:(id)a3 eventType:(int)a4 blendingCacheId:(id)a5 suggestionIds:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  int v10 = (objc_class *)MEMORY[0x1E4F4B130];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  BOOL v14 = (void *)[[v10 alloc] initWithDate:v13 eventType:v7 blendingCacheId:v12 suggestionIds:v11];

  uint64_t v15 = [MEMORY[0x1E4F4B388] uiEventWithLockscreenEvent:v14];
  id v16 = objc_opt_new();
  [v16 donateGenericUIEvent:v15];
  uint64_t v17 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[ATXActionNotificationServer _sendLockscreenEventToBiomeWithDate:eventType:blendingCacheId:suggestionIds:]((uint64_t)self, v14, v17);
  }
}

- (BOOL)_isRTL
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  BOOL v4 = [v3 localeIdentifier];
  LOBYTE(v2) = [v2 characterDirectionForLanguage:v4] == 2;

  return (char)v2;
}

- (id)_localizedStringForKey:(id)a3 defaultValue:(id)a4 languageCode:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if (!v9)
  {
    id v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v9 = [v11 localeIdentifier];

    if (!v9)
    {
LABEL_16:
      if (objc_msgSend(v8, "length", (void)v22)) {
        id v20 = v8;
      }
      else {
        id v20 = v7;
      }
      id v16 = v20;
      goto LABEL_20;
    }
  }
  CFArrayRef v12 = (const __CFArray *)[v10 localizations];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  CFArrayRef v13 = CFBundleCopyLocalizationsForPreferences(v12, (CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObject:v9]);
  uint64_t v14 = [(__CFArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v14)
  {

    goto LABEL_16;
  }
  uint64_t v15 = v14;
  id v16 = 0;
  uint64_t v17 = *(void *)v23;
  while (2)
  {
    uint64_t v18 = 0;
    BOOL v19 = v16;
    do
    {
      if (*(void *)v23 != v17) {
        objc_enumerationMutation(v13);
      }
      CFBundleGetBundleWithIdentifier((CFStringRef)objc_msgSend(v10, "bundleIdentifier", (void)v22));
      id v16 = (void *)CFBundleCopyLocalizedStringForLocalization();

      if (v16 && ([v16 isEqualToString:v7] & 1) == 0)
      {

        goto LABEL_20;
      }
      ++v18;
      BOOL v19 = v16;
    }
    while (v15 != v18);
    uint64_t v15 = [(__CFArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15) {
      continue;
    }
    break;
  }

  if (!v16) {
    goto LABEL_16;
  }
LABEL_20:

  return v16;
}

- (id)_actionKeyFromNotification:(id)a3
{
  id v3 = [a3 request];
  BOOL v4 = [v3 content];
  BOOL v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"actionKey"];

  return v6;
}

- (id)_blendingCacheUpdateUUIDFromNotification:(id)a3
{
  id v3 = [a3 request];
  BOOL v4 = [v3 content];
  BOOL v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"blendingCacheUpdateUUID"];

  if (v6) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_unarchiveProactiveSuggestionFromNotification:(id)a3
{
  BOOL v4 = [a3 request];
  BOOL v5 = [v4 content];
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"proactiveSuggestion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if (v8)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithProtoData:v8];
      goto LABEL_10;
    }
    int v10 = __atxlog_handle_ui();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXActionNotificationServer _unarchiveProactiveSuggestionFromNotification:]((uint64_t)self, v10);
    }
  }
  else
  {
    id v8 = __atxlog_handle_ui();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      [(ATXActionNotificationServer *)(uint64_t)self _unarchiveProactiveSuggestionFromNotification:v8];
    }
  }
  id v9 = 0;
LABEL_10:

  return v9;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = __atxlog_handle_notifications();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v66 = v7;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "daemon didReceiveNotificationResponse: %@", buf, 0xCu);
  }

  int v10 = [v7 notification];
  id v11 = [(ATXActionNotificationServer *)self _unarchiveProactiveSuggestionFromNotification:v10];

  CFArrayRef v12 = [v11 atxActionExecutableObject];
  CFArrayRef v13 = [v7 notification];
  uint64_t v14 = [(ATXActionNotificationServer *)self _blendingCacheUpdateUUIDFromNotification:v13];

  uint64_t v15 = [v7 actionIdentifier];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F446D0]];
  uint64_t v17 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412546;
    id v66 = v15;
    __int16 v67 = 2112;
    __int16 v68 = v12;
    _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "received notification center response with identifier: %@ for action: %@", buf, 0x16u);
  }

  if (v11 && v12)
  {
    v57 = v15;
    id v58 = v7;
    if (v16) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 3;
    }
    v59 = v14;
    BOOL v19 = objc_opt_new();
    [v11 uuid];
    v21 = id v20 = v11;
    v64 = v21;
    long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    [(ATXActionNotificationServer *)self _sendLockscreenEventToBiomeWithDate:v19 eventType:v18 blendingCacheId:v59 suggestionIds:v22];

    uint64_t v14 = v59;
    long long v23 = objc_opt_new();
    [(ATXActionNotificationServer *)self _sendLockscreenEventToBiomeWithDate:v23 eventType:4 blendingCacheId:v59 suggestionIds:0];

    engagementRecordManager = self->_engagementRecordManager;
    if (v16)
    {
      v56 = v20;
      [(ATXEngagementRecordManager *)engagementRecordManager addEngagedSuggestion:v20 engagementRecordType:1];
      if ([v12 actionType] == 5)
      {
        long long v25 = __atxlog_handle_notifications();
        id v7 = v58;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          long long v26 = [v12 bundleId];
          *(_DWORD *)id buf = 138412290;
          id v66 = v26;
          _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "launching UAUserActivityProxy for bundleId: %@", buf, 0xCu);
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
        block[3] = &unk_1E68AB818;
        id v61 = v12;
        dispatch_async(MEMORY[0x1E4F14428], block);
        if (v8) {
          v8[2](v8);
        }

        id v11 = v56;
        goto LABEL_41;
      }
      id v7 = v58;
      if ([v12 actionType]
        || ([v12 intent],
            __int16 v28 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v28,
            (isKindOfClass & 1) == 0))
      {
        if ([v12 actionType] && objc_msgSend(v12, "actionType") != 2)
        {
          if ([v12 actionType] != 1)
          {
            v52 = __atxlog_handle_notifications();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
              -[ATXActionNotificationServer userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]();
            }

            v47 = 0;
            int64_t v31 = 0;
            id v11 = v56;
            goto LABEL_50;
          }
          id v48 = objc_alloc(MEMORY[0x1E4F30738]);
          uint64_t v30 = [v12 userActivity];
          uint64_t v49 = [v12 bundleId];
          uint64_t v32 = [v48 initWithUserActivity:v30 bundleIdentifier:v49];

          int64_t v31 = 0;
          uint64_t v36 = 2;
LABEL_32:

          long long v37 = __atxlog_handle_notifications();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl(&dword_1D0FA3000, v37, OS_LOG_TYPE_DEFAULT, "invoking ShortcutsRuntime for execution", buf, 2u);
          }

          if (v31)
          {
            uint64_t v54 = v36;
            v55 = (void *)v32;
            id v38 = objc_alloc(MEMORY[0x1E4FB49C0]);
            long long v39 = [v12 bundleId];
            long long v40 = (WFSuggestionsWorkflowRunnerClient *)[v38 initWithLinkAction:v31 bundleIdentifier:v39 resultSurface:2];
            currentWorkflowRunnerClient = self->_currentWorkflowRunnerClient;
            self->_currentWorkflowRunnerClient = v40;

            goto LABEL_38;
          }
          if (v32)
          {
            uint64_t v54 = v36;
            v55 = (void *)v32;
            v42 = (WFSuggestionsWorkflowRunnerClient *)[objc_alloc(MEMORY[0x1E4FB49C0]) initWithINShortcut:v32 executionContext:3];
            long long v39 = self->_currentWorkflowRunnerClient;
            self->_currentWorkflowRunnerClient = v42;
LABEL_38:

            [(WFSuggestionsWorkflowRunnerClient *)self->_currentWorkflowRunnerClient setDelegate:self];
            v62[0] = @"notifID";
            v43 = [v58 notification];
            v44 = [v43 request];
            int64_t v45 = [v44 identifier];
            v62[1] = @"atxAction";
            v63[0] = v45;
            v63[1] = v12;
            uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
            [(WFSuggestionsWorkflowRunnerClient *)self->_currentWorkflowRunnerClient setUserInfo:v46];

            [(WFSuggestionsWorkflowRunnerClient *)self->_currentWorkflowRunnerClient start];
            [MEMORY[0x1E4F4B150] logActionViewForType:v54 inContext:2];
            id v11 = v56;
            uint64_t v15 = v57;
            uint64_t v14 = v59;
            v47 = v55;
            if (!v8)
            {
LABEL_40:

              goto LABEL_41;
            }
LABEL_39:
            v8[2](v8);
            goto LABEL_40;
          }
          v53 = __atxlog_handle_notifications();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
            -[ATXActionNotificationServer userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]();
          }

          v47 = 0;
          int64_t v31 = 0;
          id v11 = v56;
          uint64_t v14 = v59;
LABEL_50:
          uint64_t v15 = v57;
          if (!v8) {
            goto LABEL_40;
          }
          goto LABEL_39;
        }
        v33 = [v12 bundleId];
        long long v34 = [v12 intent];
        [v34 _setLaunchId:v33];

        id v35 = objc_alloc(MEMORY[0x1E4F30738]);
        uint64_t v30 = [v12 intent];
        uint64_t v32 = [v35 initWithIntent:v30];
        int64_t v31 = 0;
      }
      else
      {
        uint64_t v30 = [v12 intent];
        int64_t v31 = [v30 linkAction];
        uint64_t v32 = 0;
      }
      uint64_t v36 = 1;
      goto LABEL_32;
    }
    [(ATXEngagementRecordManager *)engagementRecordManager addHiddenSuggestion:v20 duration:120 engagementRecordType:*MEMORY[0x1E4F4B508]];
    id v11 = v20;
    id v7 = v58;
    if (!v8) {
      goto LABEL_41;
    }
LABEL_24:
    v8[2](v8);
    goto LABEL_41;
  }
  if (v14)
  {
    uint64_t v27 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      v50 = (objc_class *)objc_opt_class();
      uint64_t v51 = NSStringFromClass(v50);
      *(_DWORD *)id buf = 138413058;
      id v66 = v51;
      __int16 v67 = 2112;
      __int16 v68 = v14;
      __int16 v69 = 2112;
      v70 = v11;
      __int16 v71 = 2112;
      v72 = v12;
      _os_log_fault_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_FAULT, "%@ - found blendingCacheUpdateUUID: %@, but no suggestion or action: %@ %@", buf, 0x2Au);
    }
  }
  if (v8) {
    goto LABEL_24;
  }
LABEL_41:
}

void __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F626A0];
  v7[0] = *MEMORY[0x1E4F62688];
  v7[1] = v2;
  v8[0] = MEMORY[0x1E4F1CC38];
  v8[1] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  BOOL v4 = [*(id *)(a1 + 32) userActivityProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E68B53A0;
  id v6 = *(id *)(a1 + 32);
  [v4 launchActivityWithOptions:v3 completionHandler:v5];
}

void __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a2) {
    goto LABEL_5;
  }
  id v6 = __atxlog_handle_notifications();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) bundleId];
    int v11 = 138412290;
    CFArrayRef v12 = v7;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "successfully launched UAUserActivityProxy for bundleId: %@", (uint8_t *)&v11, 0xCu);
  }
  if (v5)
  {
LABEL_5:
    id v8 = __atxlog_handle_notifications();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2_cold_1(a1, (uint64_t)v5, v8);
    }
  }
  id v9 = [*(id *)(a1 + 32) userActivityProxy];
  id v10 = self;
}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = __atxlog_handle_notifications();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    id v9 = v5;
    __int16 v10 = 2048;
    id v11 = v6;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "workflowRunnerClient: <%p> didStartRunningWorkflowWithProgress: <%p>", (uint8_t *)&v8, 0x16u);
  }
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = __atxlog_handle_notifications();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 134217984;
    id v24 = v9;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "workflowRunnerClient: <%p> didFinishRunningWorkflowWithOutput:error:cancelled:", (uint8_t *)&v23, 0xCu);
  }

  if (v10 || v6)
  {
    if (v6)
    {
      uint64_t v18 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "ShortcutsRuntime was cancelled. Keeping notification on screen.", (uint8_t *)&v23, 2u);
      }
    }
    if (v10)
    {
      BOOL v19 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ATXActionNotificationServer workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:]();
      }

      [MEMORY[0x1E4F4B150] logError:7 inContext:2];
    }
  }
  else
  {
    uint64_t v12 = __atxlog_handle_notifications();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "ShortcutsRuntime completed successfully.", (uint8_t *)&v23, 2u);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v9;
      uint64_t v14 = [v13 userInfo];
      uint64_t v15 = [v14 objectForKeyedSubscript:@"notifID"];
      int v16 = __atxlog_handle_notifications();
      uint64_t v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138412290;
          id v24 = v15;
          _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "therefore removing notification with req id: %@", (uint8_t *)&v23, 0xCu);
        }

        [(ATXActionNotificationServer *)self _removeNotificationWithIdentifier:v15 trackEvent:1];
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[ATXActionNotificationServer workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:]();
        }
      }
      __int16 v21 = [v14 objectForKeyedSubscript:@"atxAction"];
      if ([v21 actionType] == 1) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = 1;
      }
      [MEMORY[0x1E4F4B150] logActionExecuteForType:v22 inContext:2];
    }
    else
    {
      id v20 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[ATXActionNotificationServer workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:]();
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_notifySuccessTracker, 0);
  objc_storeStrong((id *)&self->_notifyErrorTracker, 0);
  objc_storeStrong((id *)&self->_notifyInitTracker, 0);
  objc_storeStrong((id *)&self->_removeTracker, 0);
  objc_storeStrong((id *)&self->_currentWorkflowRunnerClient, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

void __35__ATXActionNotificationServer_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "notification center access not granted!: %@", v2, v3, v4, v5, v6);
}

- (void)postNotificationForATXAction:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Unexpected prediction already on lockscreen", v2, v3, v4, v5, v6);
}

void __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Timed out while waiting for current notification status", v2, v3, v4, v5, v6);
}

void __72__ATXActionNotificationServer_proactiveSuggestionsCurrentlyOnLockscreen__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Timed out while waiting for proactiveSuggestionsCurrentlyOnLockscreen", v2, v3, v4, v5, v6);
}

- (void)_postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "No action, not posting notification.", v2, v3, v4, v5, v6);
}

- (void)_postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "no bundleId for action, bailing", v2, v3, v4, v5, v6);
}

- (void)_postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "title and body were empty, bailing", v2, v3, v4, v5, v6);
}

void __95__ATXActionNotificationServer__postNotificationForProactiveSuggestion_blendingCacheUpdateUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "addNotificationRequest failed: %@", v2, v3, v4, v5, v6);
}

- (void)removeActionPredictionNotificationsMatchingAction:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Timed out while waiting for getDeliveredNotificationsWithCompletionHandler to complete", v2, v3, v4, v5, v6);
}

- (void)_sendLockscreenEventToBiomeWithDate:(NSObject *)a3 eventType:blendingCacheId:suggestionIds:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint8_t v6 = NSStringFromClass(v5);
  id v7 = [a2 jsonDict];
  int v8 = 138412546;
  id v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "%@ - wrote lockscreen event to Biome: %@", (uint8_t *)&v8, 0x16u);
}

- (void)_unarchiveProactiveSuggestionFromNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%@ - no proactive suggestion data available in provided UNNotificationResponse", v5, 0xCu);
}

- (void)_unarchiveProactiveSuggestionFromNotification:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_FAULT, "%@ - value: %@ found for key kATXProactiveSuggestionUserInfoDictKey is not NSData, returning nil", v6, 0x16u);
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Tried to create workflow runner with nil entity", v2, v3, v4, v5, v6);
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Tried to handle unknown action type in notification response delegate", v2, v3, v4, v5, v6);
}

void __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) bundleId];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "failed to launch UAUserActivityProxy for bundleId: %@: %@", v5, 0x16u);
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "workflowRunnerClient:didFinishRunningWithError: %@", v2, v3, v4, v5, v6);
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "no notificationRequestId in userInfo!", v2, v3, v4, v5, v6);
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "workflowRunnerClient is not of expected type!", v2, v3, v4, v5, v6);
}

@end