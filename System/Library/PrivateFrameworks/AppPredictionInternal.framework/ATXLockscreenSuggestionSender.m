@interface ATXLockscreenSuggestionSender
- (ATXLockscreenSuggestionSender)init;
- (ATXLockscreenSuggestionSender)initWithLockscreenBlacklist:(id)a3 actionNotificationServer:(id)a4 userDefaults:(id)a5;
- (id)_cachedExecutableIdentifier;
- (void)_updateCachedExecutableIdentifierWithSuggestion:(id)a3;
- (void)blendingLayerDidUpdateLockscreenUICache:(id)a3;
@end

@implementation ATXLockscreenSuggestionSender

- (ATXLockscreenSuggestionSender)init
{
  v3 = +[ATXLockscreenBlacklist sharedInstance];
  v4 = +[ATXActionNotificationServer sharedInstance];
  id v5 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v6 = (void *)[v5 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v7 = [(ATXLockscreenSuggestionSender *)self initWithLockscreenBlacklist:v3 actionNotificationServer:v4 userDefaults:v6];

  return v7;
}

- (ATXLockscreenSuggestionSender)initWithLockscreenBlacklist:(id)a3 actionNotificationServer:(id)a4 userDefaults:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXLockscreenSuggestionSender;
  v12 = [(ATXLockscreenSuggestionSender *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_lockscreenBlacklist, a3);
    objc_storeStrong((id *)&v13->_actionNotificationServer, a4);
    objc_storeStrong((id *)&v13->_userDefaults, a5);
  }

  return v13;
}

- (void)blendingLayerDidUpdateLockscreenUICache:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_blending();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v35 = 138412546;
    v36 = v7;
    __int16 v37 = 2112;
    id v38 = v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - received new ui cache: %@", (uint8_t *)&v35, 0x16u);
  }
  v8 = [v4 allSuggestionsInLayout];
  id v9 = [v8 firstObject];
  id v10 = [v9 executableSpecification];
  id v11 = [v10 executableIdentifier];

  v12 = [(ATXLockscreenSuggestionSender *)self _cachedExecutableIdentifier];
  [(ATXLockscreenSuggestionSender *)self _updateCachedExecutableIdentifierWithSuggestion:v9];
  if (![(ATXLockscreenBlacklist *)self->_lockscreenBlacklist isPredictionGloballyDisabled])
  {
    LOBYTE(v35) = 0;
    CFStringRef v16 = (const __CFString *)*MEMORY[0x1E4F4B688];
    if (CFPreferencesGetAppBooleanValue(@"displayDonationsOnLockscreen", (CFStringRef)*MEMORY[0x1E4F4B688], (Boolean *)&v35)|| (LOBYTE(v35) = 0, CFPreferencesGetAppBooleanValue(@"displayLastDonationOnCoverSheet", v16, (Boolean *)&v35)))
    {
      v17 = __atxlog_handle_blending();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        int v35 = 138412290;
        v36 = v19;
        _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "%@ - not forwarding predictions to lockscreen because demo or developer switch was on", (uint8_t *)&v35, 0xCu);
      }
LABEL_11:

      goto LABEL_12;
    }
    if (v12)
    {
      id v20 = v11;
      if (v20)
      {
        int v21 = [v12 isEqualToString:v20];

        if (v21)
        {
          id v22 = v12;
          goto LABEL_20;
        }
      }
      v23 = __atxlog_handle_blending();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        int v35 = 138412290;
        v36 = v25;
        _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_INFO, "%@ - revoke needed for old lock screen predictions", (uint8_t *)&v35, 0xCu);
      }
      [(ATXActionNotificationServer *)self->_actionNotificationServer removeAllActionPredictionNotificationsAndTrackEvent:1 recordFeedback:1];
      id v26 = v12;
      if (v20)
      {
LABEL_20:
        char v27 = [v20 isEqualToString:v12];

        if (v27) {
          goto LABEL_12;
        }
        goto LABEL_25;
      }
    }
    else
    {
      v28 = __atxlog_handle_blending();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        int v35 = 138412290;
        v36 = v30;
        _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_INFO, "%@ - revoking, although no old lock screen predictions detected", (uint8_t *)&v35, 0xCu);
      }
      [(ATXActionNotificationServer *)self->_actionNotificationServer removeAllActionPredictionNotificationsAndTrackEvent:0 recordFeedback:0];
      if (v11)
      {
LABEL_25:
        v31 = __atxlog_handle_blending();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          int v35 = 138412290;
          v36 = v33;
          _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_INFO, "%@ - post needed for new lock screen predictions", (uint8_t *)&v35, 0xCu);
        }
        actionNotificationServer = self->_actionNotificationServer;
        v17 = [v4 uuid];
        [(ATXActionNotificationServer *)actionNotificationServer postNotificationForProactiveSuggestion:v9 blendingCacheUpdateUUID:v17];
        goto LABEL_11;
      }
    }

    goto LABEL_12;
  }
  v13 = __atxlog_handle_blending();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    objc_super v15 = NSStringFromClass(v14);
    int v35 = 138412290;
    v36 = v15;
    _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "%@ - not forwarding predictions to lockscreen because predictions are globally disabled", (uint8_t *)&v35, 0xCu);
  }
  [(ATXActionNotificationServer *)self->_actionNotificationServer removeAllActionPredictionNotificationsAndTrackEvent:0 recordFeedback:0];
LABEL_12:
}

- (id)_cachedExecutableIdentifier
{
  return [(NSUserDefaults *)self->_userDefaults objectForKey:@"lockscreen_prediction"];
}

- (void)_updateCachedExecutableIdentifierWithSuggestion:(id)a3
{
  userDefaults = self->_userDefaults;
  id v5 = [a3 executableSpecification];
  id v4 = [v5 executableIdentifier];
  [(NSUserDefaults *)userDefaults setObject:v4 forKey:@"lockscreen_prediction"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_actionNotificationServer, 0);
  objc_storeStrong((id *)&self->_lockscreenBlacklist, 0);
}

@end