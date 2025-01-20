@interface ATXTurnOffNotificationsForAppSuggestionManager
- (ATXTurnOffNotificationsForAppSuggestionManager)init;
- (ATXTurnOffNotificationsForAppSuggestionManager)initWithDataStore:(id)a3;
- (id)activeSuggestions;
- (void)activeSuggestions;
@end

@implementation ATXTurnOffNotificationsForAppSuggestionManager

- (ATXTurnOffNotificationsForAppSuggestionManager)init
{
  v3 = objc_opt_new();
  v4 = [(ATXTurnOffNotificationsForAppSuggestionManager *)self initWithDataStore:v3];

  return v4;
}

- (ATXTurnOffNotificationsForAppSuggestionManager)initWithDataStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTurnOffNotificationsForAppSuggestionManager;
  v6 = [(ATXTurnOffNotificationsForAppSuggestionManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataStore, a3);
  }

  return v7;
}

- (id)activeSuggestions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v4 doubleForKey:*MEMORY[0x1E4F4B6C8]];
  double v6 = v5;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v5];
  v8 = [(ATXNotificationAndSuggestionDatastore *)self->_dataStore allNotificationsFromBundleId:@"com.apple.tips" sinceTimestamp:v6];
  if ((unint64_t)[v8 count] > 3)
  {
    objc_super v9 = [v8 objectAtIndexedSubscript:3];
    v11 = [v9 second];
    int v12 = [v11 isEqual:&unk_1F27F0C78];

    if (v12)
    {
      v13 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "-[ATXTurnOffNotificationsForAppSuggestionManager activeSuggestions]";
        __int16 v24 = 2048;
        uint64_t v25 = 4;
        __int16 v26 = 2112;
        v27 = @"com.apple.tips";
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "%s: The %ldth notification from %@ is not active so not sending a suggestion", buf, 0x20u);
      }
    }
    else
    {
      v14 = [v9 second];
      char v15 = [v14 isEqual:&unk_1F27F0C90];

      if (v15)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F4B1B0]);
        v17 = objc_opt_new();
        v18 = [MEMORY[0x1E4F1C9C8] now];
        v19 = [v9 first];
        v13 = [v16 initTurnOffNotificationsForAppSuggestionWithUUID:v17 bundleID:@"com.apple.tips" timestamp:v18 triggerNotificationUUID:v19];

        v21 = v13;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
LABEL_13:

        goto LABEL_14;
      }
      v13 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        [(ATXTurnOffNotificationsForAppSuggestionManager *)v9 activeSuggestions];
      }
    }
    v10 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_13;
  }
  objc_super v9 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v23 = "-[ATXTurnOffNotificationsForAppSuggestionManager activeSuggestions]";
    __int16 v24 = 2048;
    uint64_t v25 = [v8 count];
    __int16 v26 = 2112;
    v27 = @"com.apple.tips";
    __int16 v28 = 2112;
    v29 = v7;
    __int16 v30 = 2048;
    uint64_t v31 = 4;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "%s: There were only %ld notifications from %@ since the last upgrade on %@. We only send the suggestion on the %ldth notification, so not sending one.", buf, 0x34u);
  }
  v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_14:

  return v10;
}

- (void).cxx_destruct
{
}

- (void)activeSuggestions
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 second];
  int v4 = 136315394;
  double v5 = "-[ATXTurnOffNotificationsForAppSuggestionManager activeSuggestions]";
  __int16 v6 = 2112;
  v7 = v3;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%s: Unexpected value for isActive. Expecting either 0 (NO) or 1 (YES). Instead got %@", (uint8_t *)&v4, 0x16u);
}

@end