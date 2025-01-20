@interface ATXNotificationSmartPauseManager
- (ATXNotificationSmartPauseManager)init;
- (ATXNotificationSmartPauseManager)initWithNotificationAndSuggestionDataStore:(id)a3;
- (id)_dictionaryForQueryResults:(id)a3;
- (id)_proposeSmartPauseForNotification:(id)a3 threadData:(id)a4 bundleData:(id)a5;
- (id)_queryResultIdentifierForBundleId:(id)a3 threadId:(id)a4;
- (id)activeSuggestions;
- (id)currentSuggestionsGivenCandiateNotifications:(id)a3;
@end

@implementation ATXNotificationSmartPauseManager

- (ATXNotificationSmartPauseManager)init
{
  v3 = objc_opt_new();
  v4 = [(ATXNotificationSmartPauseManager *)self initWithNotificationAndSuggestionDataStore:v3];

  return v4;
}

- (ATXNotificationSmartPauseManager)initWithNotificationAndSuggestionDataStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationSmartPauseManager;
  v6 = [(ATXNotificationSmartPauseManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    uint64_t v8 = [MEMORY[0x1E4F4B1D0] sharedInstance];
    notificationManagementMAConstants = v7->_notificationManagementMAConstants;
    v7->_notificationManagementMAConstants = (ATXNotificationManagementMAConstants *)v8;
  }
  return v7;
}

- (id)_queryResultIdentifierForBundleId:(id)a3 threadId:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@ %@", a3, a4];
}

- (id)_dictionaryForQueryResults:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "bundleId", (void)v16);
        v13 = [v11 threadId];
        v14 = [(ATXNotificationSmartPauseManager *)self _queryResultIdentifierForBundleId:v12 threadId:v13];
        [v5 setObject:v11 forKeyedSubscript:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_proposeSmartPauseForNotification:(id)a3 threadData:(id)a4 bundleData:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [v8 threadID];

  if (!v11)
  {
    if (v10)
    {
      double v31 = (double)(unint64_t)[v10 countLastFiveMinutesPositiveEngagements];
      double v32 = v31 / (double)(unint64_t)[v10 countLastFiveMinutesNotifications];
      v33 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        -[ATXNotificationSmartPauseManager _proposeSmartPauseForNotification:threadData:bundleData:](v10, v33, v32);
      }

      unint64_t v34 = [v10 countLastFiveMinutesNotifications];
      if (v34 > [(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants smartPauseManagerThresholdForNumNotificationsReceivedInLastFiveMinutesForApp])
      {
        [(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants smartPauseManagerEngagementRateThresholdForApp];
        if (v32 <= v35)
        {
          v38 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            -[ATXNotificationSmartPauseManager _proposeSmartPauseForNotification:threadData:bundleData:](v38);
          }

          id v39 = objc_alloc(MEMORY[0x1E4F4B218]);
          v40 = (void *)MEMORY[0x1E4F1C9C8];
          [(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants smartPauseManagerExpirationSeconds];
          v41 = objc_msgSend(v40, "dateWithTimeIntervalSinceNow:");
          [(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants smartPauseManagerPauseDurationSeconds];
          uint64_t v21 = objc_msgSend(v39, "initWithSuggestionExpiration:pauseDuration:", v41);

          id v42 = objc_alloc(MEMORY[0x1E4F4B1B0]);
          v23 = [MEMORY[0x1E4F29128] UUID];
          v24 = [v8 bundleID];
          v25 = [MEMORY[0x1E4F1C9C8] now];
          v26 = [v8 uuid];
          v27 = v42;
          v28 = v21;
          v29 = v23;
          uint64_t v30 = 1;
          goto LABEL_22;
        }
      }
    }
LABEL_15:
    v36 = 0;
    goto LABEL_16;
  }
  if (!v9) {
    goto LABEL_15;
  }
  double v12 = (double)(unint64_t)[v9 countLastFiveMinutesPositiveEngagements];
  double v13 = v12 / (double)(unint64_t)[v9 countLastFiveMinutesNotifications];
  v14 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v43 = [v8 threadID];
    int v44 = 136315906;
    v45 = "-[ATXNotificationSmartPauseManager _proposeSmartPauseForNotification:threadData:bundleData:]";
    __int16 v46 = 2112;
    v47 = v43;
    __int16 v48 = 2048;
    uint64_t v49 = [v9 countLastFiveMinutesNotifications];
    __int16 v50 = 2048;
    double v51 = v13;
    _os_log_debug_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEBUG, "%s: Considering SmartPause suggestion for thread: %@ countLastFiveMinutesNotifications: %ld lastFiveMinutesEngagementRate: %f", (uint8_t *)&v44, 0x2Au);
  }
  unint64_t v15 = [v9 countLastFiveMinutesNotifications];
  if (v15 <= [(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants smartPauseManagerThresholdForNumNotificationsReceivedInLastFiveMinutesForThread])goto LABEL_15; {
  [(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants smartPauseManagerEngagementRateThresholdForThread];
  }
  if (v13 > v16) {
    goto LABEL_15;
  }
  long long v17 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[ATXNotificationSmartPauseManager _proposeSmartPauseForNotification:threadData:bundleData:](v17);
  }

  id v18 = objc_alloc(MEMORY[0x1E4F4B218]);
  long long v19 = (void *)MEMORY[0x1E4F1C9C8];
  [(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants smartPauseManagerExpirationSeconds];
  v20 = objc_msgSend(v19, "dateWithTimeIntervalSinceNow:");
  [(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants smartPauseManagerPauseDurationSeconds];
  uint64_t v21 = objc_msgSend(v18, "initWithSuggestionExpiration:pauseDuration:", v20);

  id v22 = objc_alloc(MEMORY[0x1E4F4B1B0]);
  v23 = [MEMORY[0x1E4F29128] UUID];
  v24 = [v8 threadID];
  v25 = [MEMORY[0x1E4F1C9C8] now];
  v26 = [v8 uuid];
  v27 = v22;
  v28 = v21;
  v29 = v23;
  uint64_t v30 = 2;
LABEL_22:
  v36 = (void *)[v27 initWithSmartPauseSuggestion:v28 uuid:v29 scope:v30 entityIdentifier:v24 timestamp:v25 triggerNotificationUUID:v26];

LABEL_16:
  return v36;
}

- (id)currentSuggestionsGivenCandiateNotifications:(id)a3
{
  id v4 = a3;
  id v5 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ATXNotificationSmartPauseManager currentSuggestionsGivenCandiateNotifications:](v4, v5);
  }

  dataStore = self->_dataStore;
  uint64_t v7 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_107);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  id v9 = [(ATXNotificationAndSuggestionDatastore *)dataStore getSmartPauseFeaturesForBundleIds:v7 sinceTimestamp:v8 + -2592000.0];

  v25 = [(ATXNotificationSmartPauseManager *)self _dictionaryForQueryResults:v9];
  v24 = +[ATXSmartPauseDatabaseQueryResult groupByBundleId:v9];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v34 = 0;
  double v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  objc_super v11 = (void *)MEMORY[0x1E4F1C9C8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v13 = [v11 dateWithTimeIntervalSinceReferenceDate:v12 + -300.0];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v13 endDate:0 maxEvents:0 lastN:0 reversed:0];
  unint64_t v15 = BiomeLibrary();
  double v16 = [v15 App];
  long long v17 = [v16 InFocus];
  id v18 = [v17 publisherWithUseCase:*MEMORY[0x1E4F4B5A0] options:v14];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2;
  v33[3] = &unk_1E68AC060;
  v33[4] = &v34;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_25;
  v31[3] = &unk_1E68ABB70;
  id v19 = v10;
  id v32 = v19;
  id v20 = (id)[v18 sinkWithCompletion:v33 receiveInput:v31];
  if (*((unsigned char *)v35 + 24))
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_27;
    v26[3] = &unk_1E68B1898;
    v27 = v19;
    id v28 = v25;
    v29 = self;
    id v30 = v24;
    uint64_t v21 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v26);

    id v22 = v27;
  }
  else
  {
    id v22 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationSmartPauseManager currentSuggestionsGivenCandiateNotifications:](v22);
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F1CBF0];
  }

  _Block_object_dispose(&v34, 8);
  return v21;
}

uint64_t __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleID];
}

void __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  if (v4)
  {
    if (v4 == 1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      id v5 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2_cold_1(v3, v5);
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  if (v3)
  {
    id v5 = v3;
    uint64_t v4 = [v3 bundleID];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }

    id v3 = v5;
  }
}

id __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 bundleID];
  if (!v4)
  {
LABEL_6:
    id v6 = 0;
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 32) containsObject:v4])
  {
    id v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      unint64_t v15 = "-[ATXNotificationSmartPauseManager currentSuggestionsGivenCandiateNotifications:]_block_invoke";
      __int16 v16 = 2112;
      long long v17 = v4;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: Found app launch for bundleId: %@ in the last five minutes so not showing SmartPause for notification: %@", (uint8_t *)&v14, 0x20u);
    }

    goto LABEL_6;
  }
  uint64_t v7 = *(void **)(a1 + 40);
  double v8 = *(void **)(a1 + 48);
  id v9 = [v3 threadID];
  id v10 = [v8 _queryResultIdentifierForBundleId:v4 threadId:v9];
  objc_super v11 = [v7 objectForKeyedSubscript:v10];

  double v12 = [*(id *)(a1 + 56) objectForKeyedSubscript:v4];
  id v6 = [*(id *)(a1 + 48) _proposeSmartPauseForNotification:v3 threadData:v11 bundleData:v12];

LABEL_8:
  return v6;
}

- (id)activeSuggestions
{
  id v3 = [(ATXNotificationAndSuggestionDatastore *)self->_dataStore getTopOfProminentStackNotificationsWithLimit:10];
  uint64_t v4 = [(ATXNotificationSmartPauseManager *)self currentSuggestionsGivenCandiateNotifications:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementMAConstants, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_currentSuggestions, 0);
}

- (void)_proposeSmartPauseForNotification:(os_log_t)log threadData:bundleData:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXNotificationSmartPauseManager _proposeSmartPauseForNotification:threadData:bundleData:]";
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "%s: Sending SmartPause suggestion for app", (uint8_t *)&v1, 0xCu);
}

- (void)_proposeSmartPauseForNotification:(void *)a1 threadData:(NSObject *)a2 bundleData:(double)a3 .cold.2(void *a1, NSObject *a2, double a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [a1 countLastFiveMinutesNotifications];
  v6[0] = 136315650;
  OUTLINED_FUNCTION_0_11();
  __int16 v7 = v5;
  double v8 = a3;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "%s: Considering SmartPause suggestion for app, countLastFiveMinutesNotifications: %ld lastFiveMinutesEngagementRate: %f", (uint8_t *)v6, 0x20u);
}

- (void)_proposeSmartPauseForNotification:(os_log_t)log threadData:bundleData:.cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXNotificationSmartPauseManager _proposeSmartPauseForNotification:threadData:bundleData:]";
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "%s: Sending SmartPause suggestion for notification", (uint8_t *)&v1, 0xCu);
}

- (void)currentSuggestionsGivenCandiateNotifications:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXNotificationSmartPauseManager currentSuggestionsGivenCandiateNotifications:]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: Not returning any SmartPause suggestions because reading app launch events from Biome failed", (uint8_t *)&v1, 0xCu);
}

- (void)currentSuggestionsGivenCandiateNotifications:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0_11();
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "%s: Fetching SmartPause suggestions for %ld candidate notifications", (uint8_t *)v3, 0x16u);
}

void __81__ATXNotificationSmartPauseManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  int v4 = 136315394;
  __int16 v5 = "-[ATXNotificationSmartPauseManager currentSuggestionsGivenCandiateNotifications:]_block_invoke_2";
  __int16 v6 = 2112;
  __int16 v7 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: Error while reading from biome: %@", (uint8_t *)&v4, 0x16u);
}

@end