@interface ATXUrgencyTuningManager
- (ATXUrgencyTuningManager)init;
- (ATXUrgencyTuningManager)initWithDataStore:(id)a3;
- (id)activeSuggestions;
- (id)urgencyTuningSuggestion:(id)a3 uuid:(id)a4 engagementStatus:(id)a5;
@end

@implementation ATXUrgencyTuningManager

- (ATXUrgencyTuningManager)init
{
  v3 = objc_opt_new();
  v4 = [(ATXUrgencyTuningManager *)self initWithDataStore:v3];

  return v4;
}

- (ATXUrgencyTuningManager)initWithDataStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXUrgencyTuningManager;
  v6 = [(ATXUrgencyTuningManager *)&v11 init];
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

- (id)activeSuggestions
{
  dataStore = self->_dataStore;
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  [v4 timeIntervalSinceReferenceDate];
  id v5 = -[ATXNotificationAndSuggestionDatastore engagementStatusOfActiveAndProminentNotificationsWithUrgency:sinceTimestamp:](dataStore, "engagementStatusOfActiveAndProminentNotificationsWithUrgency:sinceTimestamp:", 1);

  v6 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__ATXUrgencyTuningManager_activeSuggestions__block_invoke;
  v11[3] = &unk_1E68B3A90;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

void __44__ATXUrgencyTuningManager_activeSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v6 first];
  id v9 = [v6 second];

  id v11 = [v5 urgencyTuningSuggestion:v7 uuid:v8 engagementStatus:v9];

  v10 = v11;
  if (v11)
  {
    [*(id *)(a1 + 40) addObject:v11];
    v10 = v11;
  }
}

- (id)urgencyTuningSuggestion:(id)a3 uuid:(id)a4 engagementStatus:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 first];
  uint64_t v12 = [v11 unsignedIntegerValue];

  v13 = [v10 second];

  unint64_t v14 = [v13 unsignedIntegerValue];
  if (v12
    || v14 <= [(ATXNotificationManagementMAConstants *)self->_notificationManagementMAConstants urgencyTuningManagerMaxNumNonEngagementsAllowedForUrgentNotifications])
  {
    v18 = 0;
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F4B1B0]);
    v16 = objc_opt_new();
    v17 = [MEMORY[0x1E4F1C9C8] now];
    v18 = (void *)[v15 initUrgencyTuningSuggestionWithUUID:v16 bundleID:v8 timestamp:v17 triggerNotificationUUID:v9];
  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementMAConstants, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end