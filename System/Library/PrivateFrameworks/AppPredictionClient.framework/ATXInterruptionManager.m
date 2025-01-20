@interface ATXInterruptionManager
- (ATXInterruptionManager)init;
- (ATXInterruptionManager)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 modeConfigurationClient:(id)a5;
- (BOOL)appSatisfiesRelevanceCriteriaForAllowOrSilenceList:(id)a3;
- (id)recommendedAllowedAppsForMode:(unint64_t)a3;
- (id)recommendedAllowedContactsForContactScores:(id)a3;
- (id)recommendedDeniedAppsForMode:(unint64_t)a3;
- (id)recommendedDeniedContactsForMode:(unint64_t)a3;
- (id)recommendedDeniedContactsForMode:(unint64_t)a3 options:(unint64_t)a4;
- (void)recommendedAllowedContactsForDNDMode:(id)a3 reply:(id)a4;
- (void)recommendedAllowedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4;
- (void)recommendedAllowedContactsForMode:(unint64_t)a3 reply:(id)a4;
- (void)recommendedAndCandidateAllowedAppsForDNDMode:(id)a3 reply:(id)a4;
- (void)recommendedAndCandidateAllowedAppsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4;
- (void)recommendedAndCandidateAllowedAppsForMode:(unint64_t)a3 reply:(id)a4;
- (void)recommendedAndCandidateAllowedContactsForDNDMode:(id)a3 reply:(id)a4;
- (void)recommendedAndCandidateAllowedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4;
- (void)recommendedAndCandidateAllowedContactsForMode:(unint64_t)a3 reply:(id)a4;
- (void)recommendedAndCandidateDeniedAppsForDNDMode:(id)a3 reply:(id)a4;
- (void)recommendedAndCandidateDeniedAppsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4;
- (void)recommendedAndCandidateDeniedAppsForMode:(unint64_t)a3 reply:(id)a4;
- (void)recommendedAndCandidateDeniedContactsForDNDMode:(id)a3 reply:(id)a4;
- (void)recommendedAndCandidateDeniedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4;
- (void)recommendedAndCandidateDeniedContactsForMode:(unint64_t)a3 reply:(id)a4;
- (void)recommendedDeniedContactsForDNDMode:(id)a3 reply:(id)a4;
- (void)recommendedDeniedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4;
- (void)recommendedDeniedContactsForMode:(unint64_t)a3 reply:(id)a4;
@end

@implementation ATXInterruptionManager

- (ATXInterruptionManager)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = +[ATXDNDModeConfigurationClient sharedInstance];
  v6 = [(ATXInterruptionManager *)self initWithModesModels:v3 notificationSettingsReader:v4 modeConfigurationClient:v5];

  return v6;
}

- (ATXInterruptionManager)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 modeConfigurationClient:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXInterruptionManager;
  v12 = [(ATXInterruptionManager *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modesModels, a3);
    objc_storeStrong((id *)&v13->_notificationSettingsReader, a4);
    objc_storeStrong((id *)&v13->_modeConfigurationClient, a5);
    uint64_t v14 = +[ATXNotificationManagementMAConstants sharedInstance];
    notificationManagementConstants = v13->_notificationManagementConstants;
    v13->_notificationManagementConstants = (ATXNotificationManagementMAConstants *)v14;
  }
  return v13;
}

- (id)recommendedAllowedAppsForMode:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 == 5)
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    int v13 = 0;
    v5 = -[ATXModeEntityScorerProtocol rankedAppsForMode:](self->_modesModels, "rankedAppsForMode:");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__ATXInterruptionManager_recommendedAllowedAppsForMode___block_invoke;
    v9[3] = &unk_1E5D05650;
    v9[4] = self;
    v9[5] = &v10;
    v3 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", v9);
    v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *((_DWORD *)v11 + 6);
      *(_DWORD *)buf = 67109120;
      int v15 = v7;
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "Number of allowed apps returned from Proactive for configuration suggestions = %d", buf, 8u);
    }

    _Block_object_dispose(&v10, 8);
  }

  return v3;
}

uint64_t __56__ATXInterruptionManager_recommendedAllowedAppsForMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 scoreMetadata];
  [v4 score];
  double v6 = v5;
  [*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerRecommendationThresholdForApps];
  double v8 = v7;

  if (v6 >= v8
    && (uint64_t v9 = *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24),
        [*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerMaxSuggestions] > v9)
    && [*(id *)(a1 + 32) appSatisfiesRelevanceCriteriaForAllowOrSilenceList:v3])
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)recommendedDeniedAppsForMode:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 == 4)
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v5 = -[ATXModeEntityScorerProtocol rankedAppsForDenyListForMode:](self->_modesModels, "rankedAppsForDenyListForMode:");
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    int v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__ATXInterruptionManager_recommendedDeniedAppsForMode___block_invoke;
    v9[3] = &unk_1E5D05650;
    v9[4] = self;
    v9[5] = &v10;
    id v3 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", v9);
    double v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *((_DWORD *)v11 + 6);
      *(_DWORD *)buf = 67109120;
      int v15 = v7;
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "Number of apps returned from Proactive for deny list configuration suggestions = %d", buf, 8u);
    }

    _Block_object_dispose(&v10, 8);
  }

  return v3;
}

uint64_t __55__ATXInterruptionManager_recommendedDeniedAppsForMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 scoreMetadata];
  [v4 score];
  double v6 = v5;
  [*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerRecommendationDenyListThresholdForApps];
  double v8 = v7;

  if (v6 >= v8
    && (uint64_t v9 = *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24),
        [*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerMaxAppSuggestionsForDenyList] > v9)
    && [*(id *)(a1 + 32) appSatisfiesRelevanceCriteriaForAllowOrSilenceList:v3])
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)appSatisfiesRelevanceCriteriaForAllowOrSilenceList:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 scoreMetadata];
  double v5 = [v4 featureVector];

  double v6 = [v5 objectForKeyedSubscript:@"correlationEntitySpecificFeatures"];
  double v7 = [v6 objectForKeyedSubscript:@"notificationsReceivedInLastTwoWeeks"];

  double v8 = [v5 objectForKeyedSubscript:@"correlationNumGlobalOccurrences"];
  if ([v8 integerValue] >= 3 && objc_msgSend(v7, "integerValue") <= 1)
  {
    uint64_t v10 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v3 identifier];
      int v13 = 138412802;
      uint64_t v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = 0x4008000000000000;
      __int16 v17 = 2048;
      uint64_t v18 = 0x4000000000000000;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "Suppressing silence list sugggestion for app: %@ since it does not meet relevance criteria: globalAppLaunches.integerValue < %f / minimumNumberOfNotificationsReceivedInPastTwoWeeks >= %f", (uint8_t *)&v13, 0x20u);
    }
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)recommendedDeniedContactsForMode:(unint64_t)a3
{
  return [(ATXInterruptionManager *)self recommendedDeniedContactsForMode:a3 options:0];
}

- (id)recommendedDeniedContactsForMode:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v6 = [(ATXModeEntityScorerProtocol *)self->_modesModels rankedContactsForDenyListForMode:a3 options:a4];
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__ATXInterruptionManager_recommendedDeniedContactsForMode_options___block_invoke;
  v11[3] = &unk_1E5D05678;
  v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  double v7 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", v11);
  double v8 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *((_DWORD *)v13 + 6);
    *(_DWORD *)buf = 67109120;
    int v17 = v9;
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "Number of contacts returned from Proactive for deny list configuration suggestions = %d", buf, 8u);
  }

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __67__ATXInterruptionManager_recommendedDeniedContactsForMode_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 scoreMetadata];
  [v4 score];
  double v6 = v5;
  [*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerRecommendationDenyListThresholdForContacts];
  double v8 = v7;

  if (v6 < v8)
  {
    int v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v18 = 138412802;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      v21 = v12;
      __int16 v22 = 2112;
      id v23 = v3;
      int v13 = "%@: %@ Filtering out contact (%@) because affinity score is below threshold";
LABEL_8:
      _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, 0x20u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  uint64_t v14 = *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if ([*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerMaxContactSuggestionsForDenyList] <= v14)
  {
    int v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v16);
      uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v18 = 138412802;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      v21 = v12;
      __int16 v22 = 2112;
      id v23 = v3;
      int v13 = "%@: %@ Suggestion limit has been reached, filtering out contact: %@";
      goto LABEL_8;
    }
LABEL_9:

    uint64_t v15 = 0;
    goto LABEL_10;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v15 = 1;
LABEL_10:

  return v15;
}

- (id)recommendedAllowedContactsForContactScores:(id)a3
{
  id v4 = a3;
  double v5 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__ATXInterruptionManager_recommendedAllowedContactsForContactScores___block_invoke;
  v10[3] = &unk_1E5D056A0;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v4 enumerateObjectsUsingBlock:v10];

  double v7 = v11;
  id v8 = v6;

  return v8;
}

void __69__ATXInterruptionManager_recommendedAllowedContactsForContactScores___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v6 = [v13 scoreMetadata];
  [v6 score];
  double v8 = v7;
  [*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerRecommendationThresholdForContacts];
  double v10 = v9;

  if (v8 >= v10)
  {
    id v11 = [v13 cnContactId];

    if (v11)
    {
      [*(id *)(a1 + 40) addObject:v13];
      unint64_t v12 = [*(id *)(a1 + 40) count];
      if (v12 > [*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerMaxSuggestions]) {
        *a4 = 1;
      }
    }
  }
}

- (void)recommendedAllowedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (a3 == 5)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CBF0], 0);
  }
  else
  {
    modesModels = self->_modesModels;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__ATXInterruptionManager_recommendedAllowedContactsForMode_reply___block_invoke;
    v9[3] = &unk_1E5D056C8;
    v9[4] = self;
    id v10 = v6;
    [(ATXModeEntityScorerProtocol *)modesModels rankedContactsForMode:a3 reply:v9];
  }
}

void __66__ATXInterruptionManager_recommendedAllowedContactsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    double v5 = [*(id *)(a1 + 32) recommendedAllowedContactsForContactScores:a2];
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = [v5 count];
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "Number of allowed contacts returned from Proactive for configuration suggestions = %lu", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)recommendedAllowedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedAllowedContactsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDSemanticType:a3] reply:v7];
}

- (void)recommendedAndCandidateAllowedAppsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedAndCandidateAllowedAppsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDSemanticType:a3] reply:v7];
}

- (void)recommendedAllowedContactsForDNDMode:(id)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedAllowedContactsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDMode:a3] reply:v7];
}

- (void)recommendedAndCandidateAllowedAppsForDNDMode:(id)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedAndCandidateAllowedAppsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDMode:a3] reply:v7];
}

- (void)recommendedDeniedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedDeniedContactsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDSemanticType:a3] reply:v7];
}

- (void)recommendedAndCandidateDeniedAppsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedAndCandidateDeniedAppsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDSemanticType:a3] reply:v7];
}

- (void)recommendedDeniedContactsForDNDMode:(id)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedDeniedContactsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDMode:a3] reply:v7];
}

- (void)recommendedAndCandidateDeniedAppsForDNDMode:(id)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedAndCandidateDeniedAppsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDMode:a3] reply:v7];
}

- (void)recommendedAndCandidateAllowedContactsForDNDMode:(id)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedAndCandidateAllowedContactsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDMode:a3] reply:v7];
}

- (void)recommendedAndCandidateDeniedContactsForDNDMode:(id)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedAndCandidateDeniedContactsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDMode:a3] reply:v7];
}

- (void)recommendedAndCandidateAllowedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedAndCandidateAllowedContactsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDSemanticType:a3] reply:v7];
}

- (void)recommendedAndCandidateDeniedContactsForDNDModeSemanticType:(int64_t)a3 reply:(id)a4
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v7 = a4;
  [(ATXInterruptionManager *)self recommendedAndCandidateDeniedContactsForMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDSemanticType:a3] reply:v7];
}

- (void)recommendedDeniedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (a3 == 4)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
  }
  else
  {
    modesModels = self->_modesModels;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__ATXInterruptionManager_recommendedDeniedContactsForMode_reply___block_invoke;
    v10[3] = &unk_1E5D056F0;
    v10[4] = self;
    id v11 = v7;
    SEL v12 = a2;
    [(ATXModeEntityScorerProtocol *)modesModels rankedContactsForDenyListForMode:a3 options:0 reply:v10];
  }
}

void __65__ATXInterruptionManager_recommendedDeniedContactsForMode_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    int v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__ATXInterruptionManager_recommendedDeniedContactsForMode_reply___block_invoke_2;
    v12[3] = &unk_1E5D05678;
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[6];
    v12[5] = &v13;
    v12[6] = v8;
    v12[4] = v7;
    uint64_t v9 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", v12);
    id v10 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *((_DWORD *)v14 + 6);
      *(_DWORD *)buf = 67109120;
      int v18 = v11;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "Number of allowed contacts returned from Proactive for deny list configuration suggestions = %d", buf, 8u);
    }

    (*(void (**)(void))(a1[5] + 16))();
    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __65__ATXInterruptionManager_recommendedDeniedContactsForMode_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 scoreMetadata];
  [v4 score];
  double v6 = v5;
  [*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerRecommendationDenyListThresholdForContacts];
  double v8 = v7;

  if (v6 < v8)
  {
    uint64_t v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (objc_class *)objc_opt_class();
      int v11 = NSStringFromClass(v10);
      SEL v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v16 = 138412802;
      int v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ filtering out contact (%@) because affinity score is below threshold.", (uint8_t *)&v16, 0x20u);
    }
    goto LABEL_7;
  }
  uint64_t v13 = *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if ([*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerMaxContactSuggestionsForDenyList] <= v13)
  {
LABEL_7:
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v14 = 1;
LABEL_8:

  return v14;
}

- (void)recommendedAndCandidateAllowedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (a3 == 5)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    modesModels = self->_modesModels;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke;
    v9[3] = &unk_1E5D056C8;
    v9[4] = self;
    id v10 = v6;
    [(ATXModeEntityScorerProtocol *)modesModels rankedAppsForMode:a3 reply:v9];
  }
}

void __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = objc_opt_new();
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke_2;
    int v16 = &unk_1E5D05718;
    uint64_t v17 = *(void *)(a1 + 32);
    id v7 = v6;
    id v18 = v7;
    [v5 enumerateObjectsUsingBlock:&v13];
    double v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_msgSend(v7, "recommendedApps", v13, v14, v15, v16, v17);
      uint64_t v10 = [v9 count];
      int v11 = [v7 candidateApps];
      uint64_t v12 = [v11 count];
      *(_DWORD *)buf = 136315650;
      __int16 v20 = "-[ATXInterruptionManager recommendedAndCandidateAllowedAppsForMode:reply:]_block_invoke";
      __int16 v21 = 2048;
      uint64_t v22 = v10;
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Recommended app count: %ld Candidate app count: %ld", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = a1 + 32;
  if ([*(id *)(a1 + 32) appSatisfiesRelevanceCriteriaForAllowOrSilenceList:v6])
  {
    double v8 = [*(id *)(a1 + 40) recommendedApps];
    uint64_t v9 = [v8 count];
    uint64_t v10 = [*(id *)(a1 + 40) candidateApps];
    unint64_t v11 = [v10 count] + v9;
    unint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForAllowList];

    if (v11 >= v12)
    {
      __int16 v23 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke_2_cold_1(v7);
      }

      *a4 = 1;
    }
    else
    {
      uint64_t v13 = [v6 scoreMetadata];
      [v13 score];
      double v15 = v14;
      [*(id *)(*(void *)v7 + 32) interruptionManagerThresholdForRecommendedAppSuggestionForAllowList];
      double v17 = v16;

      if (v15 >= v17)
      {
        [*(id *)(a1 + 40) addRecommendedApp:v6];
      }
      else
      {
        id v18 = [v6 scoreMetadata];
        [v18 score];
        double v20 = v19;
        [*(id *)(*(void *)v7 + 32) interruptionManagerThresholdForCandidateAppSuggestionForAllowList];
        double v22 = v21;

        if (v20 >= v22) {
          [*(id *)(a1 + 40) addCandidateApp:v6];
        }
      }
    }
  }
}

- (void)recommendedAndCandidateDeniedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3 == 4)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    if (a3 == 5) {
      a3 = 1;
    }
    modesModels = self->_modesModels;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke;
    v9[3] = &unk_1E5D056C8;
    v9[4] = self;
    id v10 = v6;
    [(ATXModeEntityScorerProtocol *)modesModels rankedAppsForDenyListForMode:a3 reply:v9];
  }
}

void __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    double v8 = objc_opt_new();
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    double v17 = __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_35;
    id v18 = &unk_1E5D05718;
    uint64_t v19 = *(void *)(a1 + 32);
    id v9 = v8;
    id v20 = v9;
    [v5 enumerateObjectsUsingBlock:&v15];
    id v10 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = objc_msgSend(v9, "recommendedApps", v15, v16, v17, v18, v19);
      uint64_t v12 = [v11 count];
      uint64_t v13 = [v9 candidateApps];
      uint64_t v14 = [v13 count];
      *(_DWORD *)buf = 136315650;
      double v22 = "-[ATXInterruptionManager recommendedAndCandidateDeniedAppsForMode:reply:]_block_invoke";
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      __int16 v25 = 2048;
      uint64_t v26 = v14;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "%s: Returning %ld recommended apps and %ld candidate contacts", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_35(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = a1 + 32;
  if ([*(id *)(a1 + 32) appSatisfiesRelevanceCriteriaForAllowOrSilenceList:v6])
  {
    double v8 = [*(id *)(a1 + 40) recommendedApps];
    uint64_t v9 = [v8 count];
    id v10 = [*(id *)(a1 + 40) candidateApps];
    unint64_t v11 = [v10 count] + v9;
    unint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 32) interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForDenyList];

    if (v11 >= v12)
    {
      __int16 v23 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_35_cold_1(v7);
      }

      *a4 = 1;
    }
    else
    {
      uint64_t v13 = [v6 scoreMetadata];
      [v13 score];
      double v15 = v14;
      [*(id *)(*(void *)v7 + 32) interruptionManagerThresholdForRecommendedAppSuggestionForDenyList];
      double v17 = v16;

      if (v15 >= v17)
      {
        [*(id *)(a1 + 40) addRecommendedApp:v6];
      }
      else
      {
        id v18 = [v6 scoreMetadata];
        [v18 score];
        double v20 = v19;
        [*(id *)(*(void *)v7 + 32) interruptionManagerThresholdForCandidateAppSuggestionForDenyList];
        double v22 = v21;

        if (v20 >= v22) {
          [*(id *)(a1 + 40) addCandidateApp:v6];
        }
      }
    }
  }
}

- (void)recommendedAndCandidateAllowedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3 == 5)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    modesModels = self->_modesModels;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke;
    v9[3] = &unk_1E5D056C8;
    v9[4] = self;
    id v10 = v6;
    [(ATXModeEntityScorerProtocol *)modesModels rankedContactsForMode:a3 reply:v9];
  }
}

void __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = objc_opt_new();
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2;
    double v17 = &unk_1E5D056A0;
    id v7 = v6;
    uint64_t v8 = *(void *)(a1 + 32);
    id v18 = v7;
    uint64_t v19 = v8;
    [v5 enumerateObjectsUsingBlock:&v14];
    uint64_t v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_msgSend(v7, "recommendedContacts", v14, v15, v16, v17);
      uint64_t v11 = [v10 count];
      unint64_t v12 = [v7 candidateContacts];
      uint64_t v13 = [v12 count];
      *(_DWORD *)buf = 136315650;
      double v21 = "-[ATXInterruptionManager recommendedAndCandidateAllowedContactsForMode:reply:]_block_invoke";
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "%s: Returning %ld recommended contacts and %ld candidate contacts", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 cnContactId];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) recommendedContacts];
    uint64_t v9 = [v8 count];
    id v10 = [*(id *)(a1 + 32) candidateContacts];
    unint64_t v11 = [v10 count] + v9;
    uint64_t v12 = a1 + 40;
    unint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 32) interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForAllowList];

    if (v11 >= v13)
    {
      uint64_t v25 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2_cold_2(v12);
      }

      *a4 = 1;
    }
    else
    {
      uint64_t v14 = [v6 scoreMetadata];
      [v14 score];
      double v16 = v15;
      [*(id *)(*(void *)v12 + 32) interruptionManagerThresholdForRecommendedContactSuggestionForAllowList];
      double v18 = v17;

      if (v16 >= v18)
      {
        [*(id *)(a1 + 32) addRecommendedContact:v6];
      }
      else
      {
        uint64_t v19 = [v6 scoreMetadata];
        [v19 score];
        double v21 = v20;
        [*(id *)(*(void *)v12 + 32) interruptionManagerThresholdForCandidateContactSuggestionForAllowList];
        double v23 = v22;

        if (v21 >= v23) {
          [*(id *)(a1 + 32) addCandidateContact:v6];
        }
      }
    }
  }
  else
  {
    __int16 v24 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2_cold_1();
    }
  }
}

- (void)recommendedAndCandidateDeniedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 4)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    modesModels = self->_modesModels;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke;
    v9[3] = &unk_1E5D056C8;
    v9[4] = self;
    id v10 = v6;
    [(ATXModeEntityScorerProtocol *)modesModels rankedContactsForDenyListForMode:a3 options:0 reply:v9];
  }
}

void __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = objc_opt_new();
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2;
    double v17 = &unk_1E5D056A0;
    id v7 = v6;
    uint64_t v8 = *(void *)(a1 + 32);
    id v18 = v7;
    uint64_t v19 = v8;
    [v5 enumerateObjectsUsingBlock:&v14];
    uint64_t v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_msgSend(v7, "recommendedContacts", v14, v15, v16, v17);
      uint64_t v11 = [v10 count];
      uint64_t v12 = [v7 candidateContacts];
      uint64_t v13 = [v12 count];
      *(_DWORD *)buf = 136315650;
      double v21 = "-[ATXInterruptionManager recommendedAndCandidateDeniedContactsForMode:reply:]_block_invoke";
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "%s: Returning %ld recommended contacts and %ld candidate contacts", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 cnContactId];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) recommendedContacts];
    uint64_t v9 = [v8 count];
    id v10 = [*(id *)(a1 + 32) candidateContacts];
    unint64_t v11 = [v10 count] + v9;
    uint64_t v12 = a1 + 40;
    unint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 32) interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForDenyList];

    if (v11 >= v13)
    {
      uint64_t v25 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2_cold_2(v12);
      }

      *a4 = 1;
    }
    else
    {
      uint64_t v14 = [v6 scoreMetadata];
      [v14 score];
      double v16 = v15;
      [*(id *)(*(void *)v12 + 32) interruptionManagerThresholdForRecommendedContactSuggestionForDenyList];
      double v18 = v17;

      if (v16 >= v18)
      {
        [*(id *)(a1 + 32) addRecommendedContact:v6];
      }
      else
      {
        uint64_t v19 = [v6 scoreMetadata];
        [v19 score];
        double v21 = v20;
        [*(id *)(*(void *)v12 + 32) interruptionManagerThresholdForCandidateContactSuggestionForDenyList];
        double v23 = v22;

        if (v21 >= v23) {
          [*(id *)(a1 + 32) addCandidateContact:v6];
        }
      }
    }
  }
  else
  {
    __int16 v24 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2_cold_1();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementConstants, 0);
  objc_storeStrong((id *)&self->_modeConfigurationClient, 0);
  objc_storeStrong((id *)&self->_notificationSettingsReader, 0);

  objc_storeStrong((id *)&self->_modesModels, 0);
}

void __74__ATXInterruptionManager_recommendedAndCandidateAllowedAppsForMode_reply___block_invoke_2_cold_1(uint64_t a1)
{
  [(id)OUTLINED_FUNCTION_2_0(a1) interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForAllowList];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_1A790D000, v1, v2, "%s: Reached max count %ld for app suggestions, not suggesting any more.", v3, v4, v5, v6, 2u);
}

void __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "%s: error fetching ranked apps for deny list: %@", (uint8_t *)v1, 0x16u);
}

void __73__ATXInterruptionManager_recommendedAndCandidateDeniedAppsForMode_reply___block_invoke_35_cold_1(uint64_t a1)
{
  [(id)OUTLINED_FUNCTION_2_0(a1) interruptionManagerMaxRecommendedAndCandidateAppSuggestionsForDenyList];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_1A790D000, v1, v2, "%s: Reached max count %ld for app suggestions, not suggesting any more.", v3, v4, v5, v6, 2u);
}

void __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEBUG, "%s: Contact does not have cnContactId %@. Skipping", (uint8_t *)v1, 0x16u);
}

void __78__ATXInterruptionManager_recommendedAndCandidateAllowedContactsForMode_reply___block_invoke_2_cold_2(uint64_t a1)
{
  [(id)OUTLINED_FUNCTION_2_0(a1) interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForAllowList];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_1A790D000, v1, v2, "%s: Reached max count %ld for contact suggestions, not suggesting any more.", v3, v4, v5, v6, 2u);
}

void __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEBUG, "%s: Contact does not have cnContactId %@. Skipping", (uint8_t *)v1, 0x16u);
}

void __77__ATXInterruptionManager_recommendedAndCandidateDeniedContactsForMode_reply___block_invoke_2_cold_2(uint64_t a1)
{
  [(id)OUTLINED_FUNCTION_2_0(a1) interruptionManagerMaxRecommendedAndCandidateContactSuggestionsForDenyList];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_1A790D000, v1, v2, "%s: Reached max count %ld for contact suggestions, not suggesting any more.", v3, v4, v5, v6, 2u);
}

@end