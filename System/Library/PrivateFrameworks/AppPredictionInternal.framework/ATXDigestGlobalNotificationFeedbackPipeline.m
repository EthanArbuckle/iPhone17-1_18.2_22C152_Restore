@interface ATXDigestGlobalNotificationFeedbackPipeline
- (ATXDigestGlobalNotificationFeedbackPipeline)init;
- (ATXDigestGlobalNotificationFeedbackPipeline)initWithFeedbackStore:(id)a3 notificationQuantityProvider:(id)a4 lastRunTimestampKey:(id)a5 constants:(id)a6;
- (void)logGlobalNotificationStatisticsToDigestFeedbackWithXPCActivity:(id)a3;
@end

@implementation ATXDigestGlobalNotificationFeedbackPipeline

- (ATXDigestGlobalNotificationFeedbackPipeline)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  [v4 updateDatabase];
  v5 = objc_opt_new();
  v6 = [(ATXDigestGlobalNotificationFeedbackPipeline *)self initWithFeedbackStore:v3 notificationQuantityProvider:v4 lastRunTimestampKey:@"digestGlobalNotficationFeedbackPipelineLastRunTime" constants:v5];

  return v6;
}

- (ATXDigestGlobalNotificationFeedbackPipeline)initWithFeedbackStore:(id)a3 notificationQuantityProvider:(id)a4 lastRunTimestampKey:(id)a5 constants:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXDigestGlobalNotificationFeedbackPipeline;
  v15 = [(ATXDigestGlobalNotificationFeedbackPipeline *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_feedbackStore, a3);
    objc_storeStrong((id *)&v16->_notificationQuantityProvider, a4);
    objc_storeStrong((id *)&v16->_lastRunTimestampUserDefaultsKey, a5);
    objc_storeStrong((id *)&v16->_c, a6);
  }

  return v16;
}

- (void)logGlobalNotificationStatisticsToDigestFeedbackWithXPCActivity:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412290;
    v61 = v7;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "[%@] Starting pipeline", buf, 0xCu);
  }
  feedbackStore = self->_feedbackStore;
  [(ATXNotificationDigestRankingConstants *)self->_c dailyDecayFactor];
  -[ATXNotificationDigestFeedbackProtocol decayFeedbackByFactor:](feedbackStore, "decayFeedbackByFactor:");
  v9 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138412290;
    v61 = v11;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "[%@] Decayed digest feedback", buf, 0xCu);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v13 = (void *)[v12 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  double Current = CFAbsoluteTimeGetCurrent();
  v15 = [v13 objectForKey:self->_lastRunTimestampUserDefaultsKey];

  if (v15)
  {
    [v13 doubleForKey:self->_lastRunTimestampUserDefaultsKey];
    double v17 = v16;
  }
  else
  {
    double v17 = 0.0;
  }
  if ([v4 didDefer])
  {
    objc_super v18 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138412290;
      v61 = v20;
      _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred.", buf, 0xCu);
    }
  }
  else
  {
    objc_super v18 = [(ATXNotificationQuantityProviderProtocol *)self->_notificationQuantityProvider totalNotificationsPerAppFromStartTime:v17 toEndTime:Current];
    if ([v4 didDefer])
    {
      v21 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        *(_DWORD *)buf = 138412290;
        v61 = v23;
        _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred.", buf, 0xCu);
      }
    }
    else
    {
      v21 = [(ATXNotificationQuantityProviderProtocol *)self->_notificationQuantityProvider messageNotificationsPerAppFromStartTime:v17 toEndTime:Current];
      if ([v4 didDefer])
      {
        v24 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = (objc_class *)objc_opt_class();
          v26 = NSStringFromClass(v25);
          *(_DWORD *)buf = 138412290;
          v61 = v26;
          _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred.", buf, 0xCu);
        }
      }
      else
      {
        v24 = [(ATXNotificationQuantityProviderProtocol *)self->_notificationQuantityProvider timeSensitiveNonmessageNotificationsPerAppFromStartTime:v17 toEndTime:Current];
        if ([v4 didDefer])
        {
          v27 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = (objc_class *)objc_opt_class();
            v29 = NSStringFromClass(v28);
            *(_DWORD *)buf = 138412290;
            v61 = v29;
            _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred.", buf, 0xCu);
          }
        }
        else
        {
          v52 = v24;
          v53 = v21;
          v54 = self;
          v49 = v13;
          id v50 = v4;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          v48 = v18;
          v30 = v18;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v55 objects:v59 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v51 = *(void *)v56;
            do
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v56 != v51) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v34 = *(void *)(*((void *)&v55 + 1) + 8 * i);
                v35 = [v30 objectForKeyedSubscript:v34];
                uint64_t v36 = [v53 objectForKeyedSubscript:v34];
                v37 = (void *)v36;
                if (v36) {
                  v38 = (void *)v36;
                }
                else {
                  v38 = &unk_1F27F1D40;
                }
                id v39 = v38;

                uint64_t v40 = [v52 objectForKeyedSubscript:v34];
                v41 = (void *)v40;
                if (v40) {
                  v42 = (void *)v40;
                }
                else {
                  v42 = &unk_1F27F1D40;
                }
                id v43 = v42;

                -[ATXNotificationDigestFeedbackProtocol logBasicNotificationsSentForBundleId:numNotifications:](v54->_feedbackStore, "logBasicNotificationsSentForBundleId:numNotifications:", v34, [v35 unsignedIntegerValue]- (objc_msgSend(v39, "unsignedIntegerValue")+ objc_msgSend(v43, "unsignedIntegerValue")));
                v44 = v54->_feedbackStore;
                uint64_t v45 = [v43 unsignedIntegerValue];

                [(ATXNotificationDigestFeedbackProtocol *)v44 logTimeSensitiveNotificationsSentForBundleId:v34 numNotifications:v45];
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v55 objects:v59 count:16];
            }
            while (v32);
          }

          id v13 = v49;
          [v49 setDouble:v54->_lastRunTimestampUserDefaultsKey forKey:Current];
          v27 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v46 = (objc_class *)objc_opt_class();
            v47 = NSStringFromClass(v46);
            *(_DWORD *)buf = 138412290;
            v61 = v47;
            _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_INFO, "[%@] Finished logging global notifications sent", buf, 0xCu);
          }
          id v4 = v50;
          objc_super v18 = v48;
          v24 = v52;
          v21 = v53;
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_lastRunTimestampUserDefaultsKey, 0);
  objc_storeStrong((id *)&self->_notificationQuantityProvider, 0);
  objc_storeStrong((id *)&self->_feedbackStore, 0);
}

@end