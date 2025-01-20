@interface ATXSendToDigestManager
- (ATXSendToDigestManager)init;
- (ATXSendToDigestManager)initWithDataStore:(id)a3;
- (BOOL)bundleIdEligibleForSendToDigestSuggestions:(id)a3;
- (id)_proposeSendToDigestForNotification:(id)a3 bundleData:(id)a4;
- (id)activeSuggestions;
- (id)currentSuggestionsGivenCandiateNotifications:(id)a3;
@end

@implementation ATXSendToDigestManager

- (ATXSendToDigestManager)init
{
  v3 = objc_opt_new();
  v4 = [(ATXSendToDigestManager *)self initWithDataStore:v3];

  return v4;
}

- (ATXSendToDigestManager)initWithDataStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXSendToDigestManager;
  v6 = [(ATXSendToDigestManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    uint64_t v8 = objc_opt_new();
    notificationSettingsReader = v7->_notificationSettingsReader;
    v7->_notificationSettingsReader = (ATXNotificationSettingsReaderProtocol *)v8;

    uint64_t v10 = [MEMORY[0x1E4F4B1D0] sharedInstance];
    notificationManagementMAConstants = v7->_notificationManagementMAConstants;
    v7->_notificationManagementMAConstants = (ATXNotificationManagementMAConstants *)v10;
  }
  return v7;
}

- (BOOL)bundleIdEligibleForSendToDigestSuggestions:(id)a3
{
  id v4 = a3;
  if ([(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader doesAppSendNotificationsToDigest:v4])
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = +[ATXSessionTaggingAppEntity genreIdForBundleId:v4];
    v7 = (void *)v6;
    uint64_t v8 = &unk_1F27F2388;
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    id v9 = v8;

    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F27F3978];
    char v5 = [v10 containsObject:v9];
  }
  return v5;
}

- (id)currentSuggestionsGivenCandiateNotifications:(id)a3
{
  id v4 = a3;
  char v5 = [(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader notificationDigestDeliveryTimes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    dataStore = self->_dataStore;
    uint64_t v8 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_222);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v10 = [(ATXNotificationAndSuggestionDatastore *)dataStore getSmartPauseFeaturesForBundleIds:v8 sinceTimestamp:v9 + -2592000.0];

    v11 = +[ATXSmartPauseDatabaseQueryResult groupByBundleId:v10];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__ATXSendToDigestManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2;
    v15[3] = &unk_1E68B5838;
    id v16 = v11;
    v17 = self;
    id v12 = v11;
    objc_super v13 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v15);
  }
  else
  {
    objc_super v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

uint64_t __71__ATXSendToDigestManager_currentSuggestionsGivenCandiateNotifications___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleID];
}

id __71__ATXSendToDigestManager_currentSuggestionsGivenCandiateNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 bundleID];

  if (v4)
  {
    char v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 bundleID];
    v7 = [v5 objectForKeyedSubscript:v6];

    uint64_t v8 = [*(id *)(a1 + 40) _proposeSendToDigestForNotification:v3 bundleData:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)activeSuggestions
{
  id v3 = [(ATXNotificationAndSuggestionDatastore *)self->_dataStore getTopOfProminentStackNotificationsWithLimit:10];
  id v4 = [(ATXSendToDigestManager *)self currentSuggestionsGivenCandiateNotifications:v3];

  return v4;
}

- (id)_proposeSendToDigestForNotification:(id)a3 bundleData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 countPositiveEngagements];
  unint64_t v9 = [v7 countNotifications];

  uint64_t v10 = [v6 bundleID];
  v11 = [v6 uuid];
  if (([v6 isMessage] & 1) != 0
    || [v6 urgency] == 1
    || ([(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants sendToDigestEngagementRateThreshold], v12 < (double)v8 / (double)v9)|| v9 - v8 <= [(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants sendToDigestThresholdForNumNonEngagements]|| ![(ATXSendToDigestManager *)self bundleIdEligibleForSendToDigestSuggestions:v10])
  {
    id v16 = 0;
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F4B1B0]);
    v14 = objc_opt_new();
    v15 = [MEMORY[0x1E4F1C9C8] now];
    id v16 = (void *)[v13 initSendToDigestSuggestionWithUUID:v14 bundleID:v10 timestamp:v15 triggerNotificationUUID:v11];
  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementMAConstants, 0);
  objc_storeStrong((id *)&self->_notificationSettingsReader, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end