@interface ATXModeEntityScorer
- (ATXModeEntityScorer)init;
- (ATXModeEntityScorer)initWithModeEntityScorerClient:(id)a3;
- (BOOL)assignModeEntityScores:(unint64_t)a3 entityTypeIdentifier:(id)a4 entityIdentifier:(id)a5 score:(double)a6 modeConfigurationType:(int64_t)a7;
- (id)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5;
- (id)rankedAppsForDenyListForMode:(unint64_t)a3;
- (id)rankedAppsForMode:(unint64_t)a3;
- (id)rankedAppsForNotificationsForMode:(unint64_t)a3;
- (id)rankedContactsForDenyListForMode:(unint64_t)a3;
- (id)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4;
- (id)rankedContactsForNotificationsForMode:(unint64_t)a3;
- (id)rankedNotificationsForMode:(unint64_t)a3;
- (void)_attachNotificationEntityScores:(id)a3 toNotifications:(id)a4;
- (void)copyScoreMetadataFromContactModeEntities:(id)a3 toContactModeEntities:(id)a4;
- (void)copyScoreMetadataFromEntities:(id)a3 toEntities:(id)a4;
- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4;
- (void)scoreApps:(id)a3 mode:(unint64_t)a4;
- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4;
- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4;
- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4;
- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4;
- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
@end

@implementation ATXModeEntityScorer

- (ATXModeEntityScorer)init
{
  v3 = objc_opt_new();
  v4 = [(ATXModeEntityScorer *)self initWithModeEntityScorerClient:v3];

  return v4;
}

- (ATXModeEntityScorer)initWithModeEntityScorerClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXModeEntityScorer;
  v6 = [(ATXModeEntityScorer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_modeEntityScorerClient, a3);
  }

  return v7;
}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__ATXModeEntityScorer_scoreApps_mode___block_invoke;
  v11[3] = &unk_1E5D06F40;
  dispatch_semaphore_t v12 = v7;
  v8 = v7;
  [(ATXModeEntityScorer *)self scoreApps:v6 mode:a4 reply:v11];

  v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_2;
  v10[3] = &unk_1E5D05300;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_10;
  v9[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v8 timeoutSeconds:v10 onAcquire:v9 onTimeout:3.0];
}

intptr_t __38__ATXModeEntityScorer_scoreApps_mode___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_10()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_10_cold_1();
  }
}

- (id)rankedAppsForMode:(unint64_t)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke;
  v12[3] = &unk_1E5D06F68;
  v14 = &v15;
  id v6 = v5;
  v13 = v6;
  [(ATXModeEntityScorer *)self rankedAppsForMode:a3 reply:v12];
  v10[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_2;
  v11[3] = &unk_1E5D05300;
  void v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_12;
  v10[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v6 timeoutSeconds:v11 onAcquire:v10 onTimeout:3.0];
  dispatch_semaphore_t v7 = (void *)v16[5];
  if (!v7) {
    dispatch_semaphore_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  _Block_object_dispose(&v15, 8);

  return v8;
}

void __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_12()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_12_cold_1();
  }
}

- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke;
  v11[3] = &unk_1E5D06F40;
  dispatch_semaphore_t v12 = v7;
  id v8 = v7;
  [(ATXModeEntityScorer *)self scoreUserNotifications:v6 mode:a4 reply:v11];

  v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_2;
  v10[3] = &unk_1E5D05300;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_13;
  v9[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v8 timeoutSeconds:v10 onAcquire:v9 onTimeout:3.0];
}

intptr_t __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_13()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_13_cold_1();
  }
}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke;
  v11[3] = &unk_1E5D06F40;
  dispatch_semaphore_t v12 = v7;
  id v8 = v7;
  [(ATXModeEntityScorer *)self scoreNotifications:v6 mode:a4 reply:v11];

  v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke_2;
  v10[3] = &unk_1E5D05300;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke_14;
  v9[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v8 timeoutSeconds:v10 onAcquire:v9 onTimeout:3.0];
}

intptr_t __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke_14()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_13_cold_1();
  }
}

- (id)rankedNotificationsForMode:(unint64_t)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  id v20 = __Block_byref_object_dispose__6;
  id v21 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke;
  v12[3] = &unk_1E5D06F90;
  unint64_t v15 = a3;
  id v6 = v5;
  v13 = v6;
  v14 = &v16;
  [(ATXModeEntityScorer *)self rankedNotificationsForMode:a3 reply:v12];
  v10[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_15;
  v11[3] = &unk_1E5D05300;
  void v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_16;
  v10[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v6 timeoutSeconds:v11 onAcquire:v10 onTimeout:3.0];
  dispatch_semaphore_t v7 = (void *)v17[5];
  if (!v7) {
    dispatch_semaphore_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  _Block_object_dispose(&v16, 8);

  return v8;
}

void __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_15()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_16()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_16_cold_1();
  }
}

- (id)rankedAppsForNotificationsForMode:(unint64_t)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke;
  v12[3] = &unk_1E5D06F68;
  v14 = &v15;
  id v6 = v5;
  v13 = v6;
  [(ATXModeEntityScorer *)self rankedAppsForNotificationsForMode:a3 reply:v12];
  v10[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_2;
  v11[3] = &unk_1E5D05300;
  void v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_17;
  v10[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v6 timeoutSeconds:v11 onAcquire:v10 onTimeout:3.0];
  id v7 = (void *)v16[5];
  if (!v7) {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  _Block_object_dispose(&v15, 8);

  return v8;
}

void __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_17()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_17_cold_1();
  }
}

- (id)rankedContactsForNotificationsForMode:(unint64_t)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke;
  v12[3] = &unk_1E5D06F68;
  v14 = &v15;
  id v6 = v5;
  v13 = v6;
  [(ATXModeEntityScorer *)self rankedContactsForNotificationsForMode:a3 reply:v12];
  v10[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_2;
  v11[3] = &unk_1E5D05300;
  void v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_18;
  v10[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v6 timeoutSeconds:v11 onAcquire:v10 onTimeout:3.0];
  id v7 = (void *)v16[5];
  if (!v7) {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  _Block_object_dispose(&v15, 8);

  return v8;
}

void __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_18()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_18_cold_1();
  }
}

- (id)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  id v27 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke;
  v18[3] = &unk_1E5D06FB8;
  id v12 = v9;
  id v19 = v12;
  v13 = v10;
  id v20 = v13;
  id v21 = &v22;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient modeEntityScoresFromCacheForModeEntityTypeIdentifier:v8 modeIdentifier:v12 modeConfigurationType:a5 reply:v18];
  v16[4] = self;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_20;
  v17[3] = &unk_1E5D05300;
  v17[4] = self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_21;
  v16[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v13 timeoutSeconds:v17 onAcquire:v16 onTimeout:3.0];
  id v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v14;
}

void __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_cold_1(a1, (uint64_t)v7, v8);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_20()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_21()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_21_cold_1();
  }
}

- (BOOL)assignModeEntityScores:(unint64_t)a3 entityTypeIdentifier:(id)a4 entityIdentifier:(id)a5 score:(double)a6 modeConfigurationType:(int64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke;
  v20[3] = &unk_1E5D06FE0;
  uint64_t v16 = v14;
  id v21 = v16;
  uint64_t v22 = &v23;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient assignModeEntityScores:a3 entityTypeIdentifier:v12 entityIdentifier:v13 score:a7 modeConfigurationType:v20 reply:a6];
  void v18[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_23;
  v19[3] = &unk_1E5D05300;
  v19[4] = self;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_24;
  v18[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v16 timeoutSeconds:v19 onAcquire:v18 onTimeout:3.0];
  LOBYTE(self) = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)self;
}

void __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_23()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_24()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_24_cold_1();
  }
}

- (void)copyScoreMetadataFromEntities:(id)a3 toEntities:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __64__ATXModeEntityScorer_copyScoreMetadataFromEntities_toEntities___block_invoke;
  v32[3] = &unk_1E5D07008;
  id v8 = v7;
  id v33 = v8;
  uint64_t v24 = v5;
  [v5 enumerateObjectsUsingBlock:v32];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        dispatch_semaphore_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v11 = [v10 identifier];
        id v12 = [v8 objectForKeyedSubscript:v11];

        if (v12)
        {
          id v13 = [v10 identifier];
          dispatch_semaphore_t v14 = [v8 objectForKeyedSubscript:v13];

          uint64_t v15 = [ATXModeEntityScore alloc];
          uint64_t v16 = [v14 scoreMetadata];
          [v16 score];
          double v18 = v17;
          id v19 = [v14 scoreMetadata];
          id v20 = [v19 featureVector];
          id v21 = [v14 scoreMetadata];
          uint64_t v22 = [v21 uuid];
          uint64_t v23 = [(ATXModeEntityScore *)v15 initWithScore:v20 featureVector:v22 uuid:v18];
          [v10 setScoreMetadata:v23];
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v27);
  }
}

void __64__ATXModeEntityScorer_copyScoreMetadataFromEntities_toEntities___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (void)copyScoreMetadataFromContactModeEntities:(id)a3 toContactModeEntities:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __86__ATXModeEntityScorer_copyScoreMetadataFromContactModeEntities_toContactModeEntities___block_invoke;
  v33[3] = &unk_1E5D07030;
  id v8 = v7;
  id v34 = v8;
  uint64_t v25 = v5;
  [v5 enumerateObjectsUsingBlock:v33];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(obj);
        }
        dispatch_semaphore_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v11 = [v10 identifier];
        id v12 = [v8 objectForKeyedSubscript:v11];

        if (v12)
        {
          id v13 = [v10 identifier];
          dispatch_semaphore_t v14 = [v8 objectForKeyedSubscript:v13];

          uint64_t v15 = [ATXModeEntityScore alloc];
          uint64_t v16 = [v14 scoreMetadata];
          [v16 score];
          double v18 = v17;
          id v19 = [v14 scoreMetadata];
          id v20 = [v19 featureVector];
          id v21 = [v14 scoreMetadata];
          uint64_t v22 = [v21 uuid];
          uint64_t v23 = [(ATXModeEntityScore *)v15 initWithScore:v20 featureVector:v22 uuid:v18];
          [v10 setScoreMetadata:v23];

          uint64_t v24 = [v14 stableContactIdentifier];
          [v10 setStableContactIdentifier:v24];
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v28);
  }
}

void __86__ATXModeEntityScorer_copyScoreMetadataFromContactModeEntities_toContactModeEntities___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [v11 identifier];
  [v3 setObject:v11 forKeyedSubscript:v4];

  id v5 = [v11 cnContactId];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v11 cnContactId];
    [v6 setObject:v11 forKeyedSubscript:v7];
  }
  id v8 = [v11 rawIdentifier];

  if (v8)
  {
    id v9 = *(void **)(a1 + 32);
    dispatch_semaphore_t v10 = [v11 rawIdentifier];
    [v9 setObject:v11 forKeyedSubscript:v10];
  }
}

- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__ATXModeEntityScorer_scoreContacts_mode_reply___block_invoke;
  v13[3] = &unk_1E5D07058;
  id v15 = v9;
  unint64_t v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient scoreContacts:v11 mode:a4 reply:v13];
}

void __48__ATXModeEntityScorer_scoreContacts_mode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __48__ATXModeEntityScorer_scoreContacts_mode_reply___block_invoke_cold_1();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) copyScoreMetadataFromContactModeEntities:a2 toContactModeEntities:*(void *)(a1 + 40)];
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
}

- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__ATXModeEntityScorer_rankedContactsForMode_reply___block_invoke;
  v9[3] = &unk_1E5D06AB0;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient rankedContactsForMode:a3 reply:v9];
}

void __51__ATXModeEntityScorer_rankedContactsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __51__ATXModeEntityScorer_rankedContactsForMode_reply___block_invoke_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__ATXModeEntityScorer_scoreApps_mode_reply___block_invoke;
  v13[3] = &unk_1E5D07058;
  id v15 = v9;
  unint64_t v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient scoreApps:v11 mode:a4 reply:v13];
}

void __44__ATXModeEntityScorer_scoreApps_mode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__ATXModeEntityScorer_scoreApps_mode_reply___block_invoke_cold_1();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) copyScoreMetadataFromEntities:a2 toEntities:*(void *)(a1 + 40)];
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
}

- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__ATXModeEntityScorer_rankedAppsForMode_reply___block_invoke;
  v9[3] = &unk_1E5D06AB0;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient rankedAppsForMode:a3 reply:v9];
}

void __47__ATXModeEntityScorer_rankedAppsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __47__ATXModeEntityScorer_rankedAppsForMode_reply___block_invoke_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ATXModeEntityScorer_rankedWidgetsForMode_reply___block_invoke;
  v9[3] = &unk_1E5D06AB0;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient rankedWidgetsForMode:a3 reply:v9];
}

void __50__ATXModeEntityScorer_rankedWidgetsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __50__ATXModeEntityScorer_rankedWidgetsForMode_reply___block_invoke_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)_attachNotificationEntityScores:(id)a3 toNotifications:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v14 = [v13 identifier];
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v10);
  }
  long long v32 = v8;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        id v20 = -[ATXNotificationModeEntity initWithUserNotification:]([ATXNotificationModeEntity alloc], "initWithUserNotification:", v19, v32);
        id v21 = [(ATXNotificationModeEntity *)v20 identifier];
        uint64_t v22 = [v7 objectForKeyedSubscript:v21];

        if (v22)
        {
          uint64_t v23 = [ATXUserNotificationModelScore alloc];
          uint64_t v24 = [v22 scoreMetadata];
          [v24 score];
          double v26 = v25;
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v28 = v27;
          long long v29 = objc_opt_new();
          id v30 = [(ATXUserNotificationModelScore *)v23 initFromModelScoreData:@"ATXModeEntityScorer" modelVersion:0 score:v29 scoreTimestamp:0 scoreUUID:v26 scoreInfo:v28];

          long long v31 = [v19 derivedData];
          [v31 addScore:v30];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v16);
  }
}

- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((unint64_t)[v8 count] < 0xC351)
  {
    id v12 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_31);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__ATXModeEntityScorer_scoreUserNotifications_mode_reply___block_invoke_2;
    v13[3] = &unk_1E5D070A0;
    id v16 = v9;
    v13[4] = self;
    id v14 = v12;
    id v15 = v8;
    id v11 = v12;
    [(ATXModeEntityScorer *)self scoreNotifications:v11 mode:a4 reply:v13];
  }
  else
  {
    uint64_t v10 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXModeEntityScorer scoreUserNotifications:mode:reply:](v10);
    }

    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:28 userInfo:0];
    (*((void (**)(id, id))v9 + 2))(v9, v11);
  }
}

ATXNotificationModeEntity *__57__ATXModeEntityScorer_scoreUserNotifications_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 bundleID];

  if (v3) {
    id v3 = [[ATXNotificationModeEntity alloc] initWithUserNotification:v2];
  }

  return v3;
}

uint64_t __57__ATXModeEntityScorer_scoreUserNotifications_mode_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) _attachNotificationEntityScores:*(void *)(a1 + 40) toNotifications:*(void *)(a1 + 48)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__ATXModeEntityScorer_scoreNotifications_mode_reply___block_invoke;
  v13[3] = &unk_1E5D07058;
  id v15 = v9;
  unint64_t v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient scoreNotifications:v11 mode:a4 reply:v13];
}

void __53__ATXModeEntityScorer_scoreNotifications_mode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __53__ATXModeEntityScorer_scoreNotifications_mode_reply___block_invoke_cold_1();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) copyScoreMetadataFromEntities:a2 toEntities:*(void *)(a1 + 40)];
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
}

- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__ATXModeEntityScorer_rankedNotificationsForMode_reply___block_invoke;
  v9[3] = &unk_1E5D06AB0;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient rankedNotificationsForMode:a3 reply:v9];
}

void __56__ATXModeEntityScorer_rankedNotificationsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __56__ATXModeEntityScorer_rankedNotificationsForMode_reply___block_invoke_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__ATXModeEntityScorer_rankedAppsForNotificationsForMode_reply___block_invoke;
  v9[3] = &unk_1E5D06AB0;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient rankedAppsForNotificationsForMode:a3 reply:v9];
}

void __63__ATXModeEntityScorer_rankedAppsForNotificationsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __63__ATXModeEntityScorer_rankedAppsForNotificationsForMode_reply___block_invoke_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__ATXModeEntityScorer_rankedContactsForNotificationsForMode_reply___block_invoke;
  v9[3] = &unk_1E5D06AB0;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient rankedContactsForNotificationsForMode:a3 reply:v9];
}

void __67__ATXModeEntityScorer_rankedContactsForNotificationsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __67__ATXModeEntityScorer_rankedContactsForNotificationsForMode_reply___block_invoke_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke;
  v11[3] = &unk_1E5D06F40;
  dispatch_semaphore_t v12 = v7;
  id v8 = v7;
  [(ATXModeEntityScorer *)self scoreAppsForDenyList:v6 mode:a4 reply:v11];

  void v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_2;
  v10[3] = &unk_1E5D05300;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_35;
  v9[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v8 timeoutSeconds:v10 onAcquire:v9 onTimeout:3.0];
}

intptr_t __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    id v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_35()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_35_cold_1();
  }
}

- (id)rankedAppsForDenyListForMode:(unint64_t)a3
{
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  double v18 = __Block_byref_object_copy__6;
  id v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke;
  v12[3] = &unk_1E5D06F68;
  id v14 = &v15;
  id v6 = v5;
  id v13 = v6;
  [(ATXModeEntityScorer *)self rankedAppsForDenyListForMode:a3 reply:v12];
  v10[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_2;
  v11[3] = &unk_1E5D05300;
  void v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_36;
  v10[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v6 timeoutSeconds:v11 onAcquire:v10 onTimeout:3.0];
  dispatch_semaphore_t v7 = (void *)v16[5];
  if (!v7) {
    dispatch_semaphore_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  _Block_object_dispose(&v15, 8);

  return v8;
}

void __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    id v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_36()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_36_cold_1();
  }
}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__ATXModeEntityScorer_scoreAppsForDenyList_mode_reply___block_invoke;
  v13[3] = &unk_1E5D07058;
  id v15 = v9;
  unint64_t v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient scoreAppsForDenyList:v11 mode:a4 reply:v13];
}

void __55__ATXModeEntityScorer_scoreAppsForDenyList_mode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55__ATXModeEntityScorer_scoreAppsForDenyList_mode_reply___block_invoke_cold_1();
    }

    dispatch_semaphore_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) copyScoreMetadataFromEntities:a2 toEntities:*(void *)(a1 + 40)];
    dispatch_semaphore_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
}

- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ATXModeEntityScorer_rankedAppsForDenyListForMode_reply___block_invoke;
  v9[3] = &unk_1E5D06AB0;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient rankedAppsForDenyListForMode:a3 reply:v9];
}

void __58__ATXModeEntityScorer_rankedAppsForDenyListForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__ATXModeEntityScorer_rankedAppsForDenyListForMode_reply___block_invoke_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke;
  v11[3] = &unk_1E5D06F40;
  dispatch_semaphore_t v12 = v7;
  id v8 = v7;
  [(ATXModeEntityScorer *)self scoreContactsForDenyList:v6 mode:a4 reply:v11];

  void v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_2;
  v10[3] = &unk_1E5D05300;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_37;
  v9[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v8 timeoutSeconds:v10 onAcquire:v9 onTimeout:3.0];
}

intptr_t __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    id v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_37()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_37_cold_1();
  }
}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3
{
  return [(ATXModeEntityScorer *)self rankedContactsForDenyListForMode:a3 options:0];
}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__6;
  id v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke;
  v14[3] = &unk_1E5D06F68;
  unint64_t v16 = &v17;
  id v8 = v7;
  id v15 = v8;
  [(ATXModeEntityScorer *)self rankedContactsForDenyListForMode:a3 options:a4 reply:v14];
  void v12[4] = self;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_2;
  v13[3] = &unk_1E5D05300;
  v13[4] = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_38;
  v12[3] = &unk_1E5D05300;
  [MEMORY[0x1E4F93B18] waitForSemaphore:v8 timeoutSeconds:v13 onAcquire:v12 onTimeout:3.0];
  id v9 = (void *)v18[5];
  if (!v9) {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  _Block_object_dispose(&v17, 8);

  return v10;
}

void __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    id v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_38()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_38_cold_1();
  }
}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__ATXModeEntityScorer_scoreContactsForDenyList_mode_reply___block_invoke;
  v13[3] = &unk_1E5D07058;
  id v15 = v9;
  unint64_t v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient scoreContactsForDenyList:v11 mode:a4 reply:v13];
}

void __59__ATXModeEntityScorer_scoreContactsForDenyList_mode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__ATXModeEntityScorer_scoreContactsForDenyList_mode_reply___block_invoke_cold_1();
    }

    dispatch_semaphore_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) copyScoreMetadataFromEntities:a2 toEntities:*(void *)(a1 + 40)];
    dispatch_semaphore_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__ATXModeEntityScorer_rankedContactsForDenyListForMode_options_reply___block_invoke;
  v11[3] = &unk_1E5D06AB0;
  id v12 = v8;
  unint64_t v13 = a3;
  id v10 = v8;
  [(ATXModeEntityScorerInterface *)modeEntityScorerClient rankedContactsForDenyListForMode:a3 options:a4 reply:v11];
}

void __70__ATXModeEntityScorer_rankedContactsForDenyListForMode_options_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __70__ATXModeEntityScorer_rankedContactsForDenyListForMode_options_reply___block_invoke_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void).cxx_destruct
{
}

void __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_10_cold_1()
{
  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to set app mode entity scores", v4, v5, v6, v7, v8);
}

void __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_12_cold_1()
{
  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to get rankedAppsForMode", v4, v5, v6, v7, v8);
}

void __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_13_cold_1()
{
  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to set notification mode entity scores", v4, v5, v6, v7, v8);
}

void __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  v1 = ATXModeToString(*(void *)(v0 + 48));
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "Did not receive rankedNotifications for mode:%@ error:%@", v4, v5, v6, v7, v8);
}

void __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_16_cold_1()
{
  uint64_t v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to get rankedNotificationsForMode", v4, v5, v6, v7, v8);
}

void __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_17_cold_1()
{
  uint64_t v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to get rankedAppsForNotificationsForMode", v4, v5, v6, v7, v8);
}

void __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_18_cold_1()
{
  uint64_t v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to get rankedContactsForNotificationsForMode", v4, v5, v6, v7, v8);
}

void __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Did not receive modeEntityScoresFromCache for mode:%@ error:%@", (uint8_t *)&v4, 0x16u);
}

void __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_21_cold_1()
{
  uint64_t v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to get modeEntityScoresFromCacheForModeEntityTypeIdentifier", v4, v5, v6, v7, v8);
}

void __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "assignModeEntityScores error:%@", v1, 0xCu);
}

void __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_24_cold_1()
{
  os_log_t v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to assignModeEntityScores", v4, v5, v6, v7, v8);
}

void __48__ATXModeEntityScorer_scoreContacts_mode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_7_0(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Did not score contacts for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

void __51__ATXModeEntityScorer_rankedContactsForMode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_6_1(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Did not receive rankedContacts for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

void __44__ATXModeEntityScorer_scoreApps_mode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_7_0(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Did not score apps for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

void __47__ATXModeEntityScorer_rankedAppsForMode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_6_1(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Did not receive rankedApps for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

void __50__ATXModeEntityScorer_rankedWidgetsForMode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_6_1(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Did not receive ranked widgets for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

- (void)scoreUserNotifications:(os_log_t)log mode:reply:.cold.1(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "More than 50,000 notifications were passed for ranking", v1, 2u);
}

void __53__ATXModeEntityScorer_scoreNotifications_mode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_7_0(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Did not score notifications for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

void __56__ATXModeEntityScorer_rankedNotificationsForMode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_6_1(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Did not receive rankedNotifications for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

void __63__ATXModeEntityScorer_rankedAppsForNotificationsForMode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_6_1(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Did not receive rankedAppsForNotifications for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

void __67__ATXModeEntityScorer_rankedContactsForNotificationsForMode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_6_1(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Did not receive rankedContactsForNotifications for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

void __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_35_cold_1()
{
  uint64_t v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  unint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to score apps for deny list", v4, v5, v6, v7, v8);
}

void __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_36_cold_1()
{
  uint64_t v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  unint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to get rankedAppsForDenyListForMode", v4, v5, v6, v7, v8);
}

void __55__ATXModeEntityScorer_scoreAppsForDenyList_mode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_7_0(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Unable to score apps for deny list for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

void __58__ATXModeEntityScorer_rankedAppsForDenyListForMode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_6_1(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Did not receive ranked apps for deny list for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

void __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_37_cold_1()
{
  uint64_t v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  unint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to score contacts for deny list", v4, v5, v6, v7, v8);
}

void __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_38_cold_1()
{
  uint64_t v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  unint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v2, v3, "%@ - timed out trying to get ranked contacts for denyl ist for mode", v4, v5, v6, v7, v8);
}

void __59__ATXModeEntityScorer_scoreContactsForDenyList_mode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_7_0(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Unable to score contacts for deny list for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

void __70__ATXModeEntityScorer_rankedContactsForDenyListForMode_options_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  unint64_t v1 = OUTLINED_FUNCTION_6_1(v0);
  uint64_t v2 = ATXModeToString(v1);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v3, v4, "Did not receive ranked contacts for deny list for mode:%@ error:%@", v5, v6, v7, v8, v9);
}

@end