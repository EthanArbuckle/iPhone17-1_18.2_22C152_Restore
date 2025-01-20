@interface ATXSendMessagesToDigestManager
- (ATXSendMessagesToDigestManager)init;
- (ATXSendMessagesToDigestManager)initWithDataStore:(id)a3;
- (BOOL)bundleIdIsEligibleForSendMessagesToDigestSuggestions:(id)a3;
- (id)activeSuggestions;
- (id)sendMessagesToDigestSuggestion:(id)a3 uuid:(id)a4 engagementStatus:(id)a5;
@end

@implementation ATXSendMessagesToDigestManager

- (ATXSendMessagesToDigestManager)init
{
  v3 = objc_opt_new();
  v4 = [(ATXSendMessagesToDigestManager *)self initWithDataStore:v3];

  return v4;
}

- (ATXSendMessagesToDigestManager)initWithDataStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXSendMessagesToDigestManager;
  v6 = [(ATXSendMessagesToDigestManager *)&v13 init];
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

- (BOOL)bundleIdIsEligibleForSendMessagesToDigestSuggestions:(id)a3
{
  id v4 = a3;
  if ([(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader doesAppSendNotificationsToDigest:v4])char v5 = [(ATXNotificationSettingsReaderProtocol *)self->_notificationSettingsReader doesAppAllowMessageBreakthrough:v4]; {
  else
  }
    char v5 = 0;

  return v5;
}

- (id)activeSuggestions
{
  dataStore = self->_dataStore;
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  [v4 timeIntervalSinceReferenceDate];
  char v5 = -[ATXNotificationAndSuggestionDatastore engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:](dataStore, "engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:");

  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  objc_super v13 = __Block_byref_object_dispose__16;
  id v14 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ATXSendMessagesToDigestManager_activeSuggestions__block_invoke;
  v8[3] = &unk_1E68AD588;
  v8[4] = self;
  v8[5] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __51__ATXSendMessagesToDigestManager_activeSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) bundleIdIsEligibleForSendMessagesToDigestSuggestions:v10])
  {
    id v6 = *(void **)(a1 + 32);
    v7 = [v5 first];
    uint64_t v8 = [v5 second];
    uint64_t v9 = [v6 sendMessagesToDigestSuggestion:v10 uuid:v7 engagementStatus:v8];

    if (v9) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];
    }
  }
}

- (id)sendMessagesToDigestSuggestion:(id)a3 uuid:(id)a4 engagementStatus:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 first];
  uint64_t v12 = [v11 unsignedIntegerValue];

  objc_super v13 = [v10 second];

  unint64_t v14 = [v13 unsignedIntegerValue];
  if (v12
    || v14 <= [(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants sendMessagesToDigestManagerMaxNumNonEngagementsAllowedForMessageNotifications])
  {
    v18 = 0;
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F4B1B0]);
    v16 = objc_opt_new();
    v17 = [MEMORY[0x1E4F1C9C8] now];
    v18 = (void *)[v15 initSendToMessagesDigestSuggestionWithUUID:v16 bundleID:v8 timestamp:v17 triggerNotificationUUID:v9];
  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementMAConstants, 0);
  objc_storeStrong((id *)&self->_notificationSettingsReader, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end