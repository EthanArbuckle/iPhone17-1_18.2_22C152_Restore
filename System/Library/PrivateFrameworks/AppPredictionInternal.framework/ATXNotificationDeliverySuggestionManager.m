@interface ATXNotificationDeliverySuggestionManager
- (ATXNotificationDeliverySuggestionManager)init;
- (ATXNotificationDeliverySuggestionManager)initWithDataStore:(id)a3 suggestionBiomeStream:(id)a4;
- (BOOL)digestHasBeenShownEnoughTimes;
- (BOOL)shouldShowSuggestion:(id)a3 withFeedback:(id)a4;
- (id)currentActiveSuggestions;
- (id)deduplicatedSuggestions:(id)a3;
- (id)filteredSuggestionsBasedOnFeedback:(id)a3;
- (id)maxOneSuggestionFromSuggestions:(id)a3;
- (unint64_t)currentMode;
- (unint64_t)getScoreForSuggestion:(id)a3;
- (void)_activeSuggestionsWithReply:(id)a3;
- (void)activeSuggestionsWithReply:(id)a3;
- (void)logSuggestionsToBiome:(id)a3;
@end

@implementation ATXNotificationDeliverySuggestionManager

- (ATXNotificationDeliverySuggestionManager)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXNotificationDeliverySuggestionManager *)self initWithDataStore:v3 suggestionBiomeStream:v4];

  return v5;
}

- (ATXNotificationDeliverySuggestionManager)initWithDataStore:(id)a3 suggestionBiomeStream:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ATXNotificationDeliverySuggestionManager;
  v9 = [(ATXNotificationDeliverySuggestionManager *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataStore, a3);
    objc_storeStrong((id *)&v10->_biomeStream, a4);
    v11 = [[ATXNotificationSmartPauseManager alloc] initWithNotificationAndSuggestionDataStore:v10->_dataStore];
    smartPauseManager = v10->_smartPauseManager;
    v10->_smartPauseManager = v11;

    v13 = [[ATXSendMessagesToDigestManager alloc] initWithDataStore:v10->_dataStore];
    sendMessagesToDigestManager = v10->_sendMessagesToDigestManager;
    v10->_sendMessagesToDigestManager = v13;

    v15 = [[ATXSendToDigestManager alloc] initWithDataStore:v10->_dataStore];
    sendToDigestManager = v10->_sendToDigestManager;
    v10->_sendToDigestManager = v15;

    v17 = [[ATXTurnOffNotificationsForAppSuggestionManager alloc] initWithDataStore:v10->_dataStore];
    turnOffNotificationsForAppManager = v10->_turnOffNotificationsForAppManager;
    v10->_turnOffNotificationsForAppManager = v17;

    uint64_t v19 = [MEMORY[0x1E4F4B1D0] sharedInstance];
    constants = v10->_constants;
    v10->_constants = (ATXNotificationManagementMAConstants *)v19;

    v21 = objc_alloc_init(ATXChinSuggestionThrottlingManager);
    throttlingManager = v10->_throttlingManager;
    v10->_throttlingManager = v21;
  }
  return v10;
}

- (unint64_t)currentMode
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F93650] currentModeSemanticType];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4AF78] sharedInstance];
    unint64_t v4 = objc_msgSend(v3, "atxModeForDNDSemanticType:", objc_msgSend(v2, "integerValue"));

    v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = ATXModeToString();
      int v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Notification delivery suggestion manager: Current mode is %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Notification delivery suggestion manager: User is not currently in a mode", (uint8_t *)&v8, 2u);
    }
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)digestHasBeenShownEnoughTimes
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  unint64_t v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F936E0]];
  if ([v4 BOOLForKey:@"digestInstances"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2419200.0];
    id v7 = objc_opt_new();
    [v6 timeIntervalSinceReferenceDate];
    int v8 = objc_msgSend(v7, "publisherFromStartTime:");

    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke;
    v13[3] = &unk_1E68ABA68;
    v13[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke_29;
    v12[3] = &unk_1E68B2C48;
    v12[4] = &v14;
    v12[5] = 7;
    id v9 = (id)[v8 drivableSinkWithBookmark:0 completion:v13 shouldContinue:v12];
    uint64_t v10 = v15[3];
    BOOL v5 = v10 == 7;
    if (v10 == 7) {
      [v4 setBool:1 forKey:@"digestInstances"];
    }
    _Block_object_dispose(&v14, 8);
  }
  return v5;
}

void __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 error];

  if (v4)
  {
    BOOL v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke_cold_1(a1, v3, v5);
    }
  }
}

BOOL __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke_29(uint64_t a1)
{
  return ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *(void *)(a1 + 40);
}

- (void)activeSuggestionsWithReply:(id)a3
{
  id v4 = a3;
  throttlingManager = self->_throttlingManager;
  v6 = [ATXChinSuggestionRequest alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__ATXNotificationDeliverySuggestionManager_activeSuggestionsWithReply___block_invoke;
  v11[3] = &unk_1E68AB528;
  v11[4] = self;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__ATXNotificationDeliverySuggestionManager_activeSuggestionsWithReply___block_invoke_2;
  v9[3] = &unk_1E68AB618;
  id v10 = v12;
  id v7 = v12;
  int v8 = [(ATXChinSuggestionRequest *)v6 initWithAcceptedBlock:v11 rejectedBlock:v9];
  [(ATXChinSuggestionThrottlingManager *)throttlingManager scheduleRequest:v8];
}

uint64_t __71__ATXNotificationDeliverySuggestionManager_activeSuggestionsWithReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activeSuggestionsWithReply:*(void *)(a1 + 40)];
}

void __71__ATXNotificationDeliverySuggestionManager_activeSuggestionsWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4AD30] code:2 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)_activeSuggestionsWithReply:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  constants = self->_constants;
  id v5 = a3;
  uint64_t v6 = [(ATXNotificationManagementMAConstants *)constants chinSuggestionsAreDisabled];
  id v7 = __atxlog_handle_notification_management();
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[ATXNotificationDeliverySuggestionManager _activeSuggestionsWithReply:]";
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: Chin suggestions are disabled. Returning empty array.", buf, 0xCu);
    }

    (*((void (**)(id, void, void))v5 + 2))(v5, MEMORY[0x1E4F1CBF0], 0);
    id v9 = v5;
  }
  else
  {
    os_signpost_id_t v10 = os_signpost_id_generate(v7);

    v11 = __atxlog_handle_notification_management();
    id v12 = v11;
    unint64_t v51 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ATXNotificationDeliverySuggestionManager.activeSuggestionsWithReply", " enableTelemetry=YES ", buf, 2u);
    }

    v13 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[ATXNotificationDeliverySuggestionManager _activeSuggestionsWithReply:]";
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "%s called. Updating the datastore...", buf, 0xCu);
    }
    os_signpost_id_t spid = v10;

    [(ATXNotificationAndSuggestionDatastore *)self->_dataStore updateDatabase];
    uint64_t v14 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_INFO, "Querying sub-models...", buf, 2u);
    }

    id v9 = [(ATXNotificationSmartPauseManager *)self->_smartPauseManager activeSuggestions];
    v15 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = objc_msgSend(v9, "count", spid);
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v16;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "Suggestion manager received %lu Smart Pause suggestions", buf, 0xCu);
    }

    uint64_t v17 = objc_opt_new();
    v18 = objc_msgSend(v17, "activeNotificationSuggestionsForMode:", -[ATXNotificationDeliverySuggestionManager currentMode](self, "currentMode"));

    uint64_t v19 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [v18 count];
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v20;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_INFO, "Suggestion manager received %lu Mode Configuration Tuning Suggestions", buf, 0xCu);
    }

    v21 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)v18;
      _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "Suggestion manager received Mode Configuration Tuning Suggestions:%@", buf, 0xCu);
    }

    v22 = [(ATXSendMessagesToDigestManager *)self->_sendMessagesToDigestManager activeSuggestions];
    v23 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v22 count];
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v24;
      _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_INFO, "Suggestion manager received %lu Send Messages To Digest Suggestions", buf, 0xCu);
    }

    v25 = [(ATXSendToDigestManager *)self->_sendToDigestManager activeSuggestions];
    v26 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = [v25 count];
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v27;
      _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_INFO, "Suggestion manager received %lu Send To Digest Suggestions", buf, 0xCu);
    }

    v28 = [(ATXTurnOffNotificationsForAppSuggestionManager *)self->_turnOffNotificationsForAppManager activeSuggestions];
    v29 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = [v28 count];
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v30;
      _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_INFO, "Suggestion manager received %lu TurnOffNotificationsForApp suggestions", buf, 0xCu);
    }

    BOOL v31 = [(ATXNotificationDeliverySuggestionManager *)self digestHasBeenShownEnoughTimes];
    v32 = objc_opt_new();
    v33 = v32;
    if (v9) {
      [v32 addObjectsFromArray:v9];
    }
    if (v18) {
      [v33 addObjectsFromArray:v18];
    }
    if (v22) {
      BOOL v34 = v31;
    }
    else {
      BOOL v34 = 0;
    }
    if (v34) {
      [v33 addObjectsFromArray:v22];
    }
    if (v25) {
      BOOL v35 = v31;
    }
    else {
      BOOL v35 = 0;
    }
    if (v35) {
      [v33 addObjectsFromArray:v25];
    }
    if (v28) {
      [v33 addObjectsFromArray:v28];
    }
    v49 = v25;
    v36 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)v33;
      _os_log_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_DEFAULT, "All suggestions: %@", buf, 0xCu);
    }
    v50 = v22;

    v37 = [(ATXNotificationDeliverySuggestionManager *)self filteredSuggestionsBasedOnFeedback:v33];
    v38 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v37;
      _os_log_impl(&dword_1D0FA3000, v38, OS_LOG_TYPE_DEFAULT, "Suggestions after removing recently shown: %@", buf, 0xCu);
    }
    v39 = v18;

    v40 = [(ATXNotificationDeliverySuggestionManager *)self deduplicatedSuggestions:v37];
    v41 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v40;
      _os_log_impl(&dword_1D0FA3000, v41, OS_LOG_TYPE_DEFAULT, "Suggestions after deduplicating: %@", buf, 0xCu);
    }

    v42 = [(ATXNotificationDeliverySuggestionManager *)self maxOneSuggestionFromSuggestions:v40];
    v43 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v42;
      _os_log_impl(&dword_1D0FA3000, v43, OS_LOG_TYPE_DEFAULT, "Suggestions after thresholding: %@", buf, 0xCu);
    }

    [(ATXNotificationDeliverySuggestionManager *)self logSuggestionsToBiome:v42];
    v44 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = [v42 count];
      *(_DWORD *)buf = 136315394;
      v53 = "-[ATXNotificationDeliverySuggestionManager _activeSuggestionsWithReply:]";
      __int16 v54 = 2048;
      uint64_t v55 = v45;
      _os_log_impl(&dword_1D0FA3000, v44, OS_LOG_TYPE_DEFAULT, "%s returning %lu suggestions", buf, 0x16u);
    }

    (*((void (**)(id, char *, void))v5 + 2))(v5, v42, 0);
    v46 = __atxlog_handle_notification_management();
    v47 = v46;
    if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v47, OS_SIGNPOST_INTERVAL_END, spid, "ATXNotificationDeliverySuggestionManager.activeSuggestionsWithReply", " enableTelemetry=YES ", buf, 2u);
    }
  }
}

- (id)filteredSuggestionsBasedOnFeedback:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_136);
  id v7 = [v4 setWithArray:v6];

  dataStore = self->_dataStore;
  id v9 = [v7 allObjects];
  os_signpost_id_t v10 = [(ATXNotificationAndSuggestionDatastore *)dataStore feedbackHistoriesForKeys:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__ATXNotificationDeliverySuggestionManager_filteredSuggestionsBasedOnFeedback___block_invoke_2;
  v14[3] = &unk_1E68B2C90;
  id v15 = v10;
  uint64_t v16 = self;
  id v11 = v10;
  id v12 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", v14);

  return v12;
}

uint64_t __79__ATXNotificationDeliverySuggestionManager_filteredSuggestionsBasedOnFeedback___block_invoke(uint64_t a1, void *a2)
{
  return [a2 feedbackKey];
}

uint64_t __79__ATXNotificationDeliverySuggestionManager_filteredSuggestionsBasedOnFeedback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 subtype] == 9)
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 feedbackKey];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (v7) {
      uint64_t v4 = [*(id *)(a1 + 40) shouldShowSuggestion:v3 withFeedback:v7];
    }
    else {
      uint64_t v4 = 1;
    }
  }
  return v4;
}

- (BOOL)shouldShowSuggestion:(id)a3 withFeedback:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v6 = a4;
  v47 = self;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[ATXNotificationManagementMAConstants numIgnoresToReject](self->_constants, "numIgnoresToReject"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    id v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (objc_msgSend(v16, "latestOutcome", v45) == 1 || objc_msgSend(v16, "latestOutcome") == 4)
        {
          ++v13;
          if (!v12)
          {
            id v12 = [v16 createdTimestamp];
          }
        }
        else if ([v16 latestOutcome] == 6)
        {
          ++v11;
          unint64_t v17 = [v7 count];
          if (v17 < [(ATXNotificationManagementMAConstants *)v47->_constants numIgnoresToReject])
          {
            v18 = [v16 createdTimestamp];
            [v7 addObject:v18];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
    id v12 = 0;
    uint64_t v13 = 0;
  }

  unint64_t v19 = v11 % [(ATXNotificationManagementMAConstants *)v47->_constants numIgnoresToReject];
  if (v19 >= [v7 count])
  {
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = [v7 objectAtIndexedSubscript:v19];
  }
  v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "distantPast", v45);
  v22 = v21;
  if (v12)
  {
    uint64_t v23 = [v21 laterDate:v12];

    v22 = (void *)v23;
  }
  uint64_t v24 = v46;
  if (v20)
  {
    uint64_t v25 = [v22 laterDate:v20];

    v22 = (void *)v25;
  }
  unint64_t v26 = v11 / [(ATXNotificationManagementMAConstants *)v47->_constants numIgnoresToReject] + v13;
  if (v26)
  {
    double v27 = (double)v26;
    if ([v46 subtype] == 4)
    {
      [(ATXNotificationManagementMAConstants *)v47->_constants smartPauseTimeoutScaleFactor];
      long double v29 = v28;
      [(ATXNotificationManagementMAConstants *)v47->_constants smartPauseStartTimeoutSeconds];
    }
    else if ([v46 subtype] == 5)
    {
      [(ATXNotificationManagementMAConstants *)v47->_constants interruptionManagementTimeoutScaleFactor];
      long double v29 = v32;
      [(ATXNotificationManagementMAConstants *)v47->_constants interruptionManagementStartTimeoutSeconds];
    }
    else
    {
      uint64_t v33 = [v46 subtype];
      constants = v47->_constants;
      if (v33 == 6)
      {
        [(ATXNotificationManagementMAConstants *)constants sendToDigestTimeoutScaleFactor];
        long double v29 = v35;
        [(ATXNotificationManagementMAConstants *)v47->_constants sendToDigestStartTimeoutSeconds];
      }
      else
      {
        [(ATXNotificationManagementMAConstants *)constants backupTimeoutScaleFactor];
        long double v29 = v36;
        [(ATXNotificationManagementMAConstants *)v47->_constants backupStartTimeoutSeconds];
      }
    }
    v37 = objc_msgSend(v22, "dateByAddingTimeInterval:", (double)(v30 * pow(v29, v27 + -1.0)));
    v38 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v39 = [v38 compare:v37];
    BOOL v31 = v39 == 1;

    v40 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      v44 = @"NO";
      *(_DWORD *)buf = 138413058;
      v53 = v43;
      __int16 v54 = 2112;
      if (v39 == 1) {
        v44 = @"YES";
      }
      uint64_t v55 = v46;
      __int16 v56 = 2112;
      v57 = v37;
      __int16 v58 = 2112;
      v59 = v44;
      _os_log_debug_impl(&dword_1D0FA3000, v40, OS_LOG_TYPE_DEBUG, "%@ - Suggestion %@ has next eligible timestamp %@.  Should show is %@", buf, 0x2Au);

      uint64_t v24 = v46;
    }
  }
  else
  {
    BOOL v31 = 1;
  }

  return v31;
}

- (id)deduplicatedSuggestions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ATXNotificationDeliverySuggestionManager *)self currentActiveSuggestions];
  if ([v5 count])
  {
    id v6 = [v5 allValues];
    id v7 = [v6 firstObject];

    unint64_t v19 = v7;
    id v8 = [v7 entityIdentifier];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v15 = [v14 entityIdentifier];
          char v16 = [v15 isEqualToString:v8];

          if (v16)
          {
            uint64_t v24 = v14;
            id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];

            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  id v17 = v4;
LABEL_13:

  return v17;
}

- (unint64_t)getScoreForSuggestion:(id)a3
{
  unint64_t v3 = [a3 subtype];
  if (v3 > 0xA) {
    return 9;
  }
  else {
    return qword_1D142B838[v3];
  }
}

- (id)maxOneSuggestionFromSuggestions:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      unint64_t v12 = [(ATXNotificationDeliverySuggestionManager *)self getScoreForSuggestion:v11];
      if (v12 > v7)
      {
        unint64_t v13 = v12;
        id v14 = v11;

        unint64_t v7 = v13;
        id v8 = v14;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  }
  while (v6);
  if (v8)
  {
    long long v21 = v8;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  }
  else
  {
LABEL_12:
    id v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (id)currentActiveSuggestions
{
  return [(ATXNotificationAndSuggestionDatastore *)self->_dataStore currentActiveSuggestions];
}

- (void)logSuggestionsToBiome:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = [v4 count];
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Replying with notification adjacent suggestions: %lu suggestions", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v12 = (void *)MEMORY[0x1D25F6CC0]();
        unint64_t v13 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v11;
          _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "notification adjacent suggestion: %@", buf, 0xCu);
        }

        id v14 = [(ATXNotificationSuggestionBiomeStream *)self->_biomeStream source];
        [v14 sendEvent:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlingManager, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_biomeStream, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_turnOffNotificationsForAppManager, 0);
  objc_storeStrong((id *)&self->_sendToDigestManager, 0);
  objc_storeStrong((id *)&self->_sendMessagesToDigestManager, 0);
  objc_storeStrong((id *)&self->_smartPauseManager, 0);
}

void __73__ATXNotificationDeliverySuggestionManager_digestHasBeenShownEnoughTimes__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [a2 error];
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "[%@] Error while sinking Biome stream: %@.", (uint8_t *)&v8, 0x16u);
}

@end