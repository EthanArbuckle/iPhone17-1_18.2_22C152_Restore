@interface ATXInterruptingNotificationsAccumulator
- (ATXInterruptingNotificationsAccumulator)init;
- (ATXInterruptingNotificationsAccumulator)initWithNotificationPublisher:(id)a3 appLaunchPublisher:(id)a4;
- (BOOL)successfullyAccumulatedInterruptingSessions;
- (NSArray)allInterruptingAppSessions;
- (void)successfullyAccumulatedInterruptingSessions;
@end

@implementation ATXInterruptingNotificationsAccumulator

- (ATXInterruptingNotificationsAccumulator)init
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  v4 = BiomeLibrary();
  v5 = [v4 Notification];
  v6 = [v5 Usage];

  v7 = BiomeLibrary();
  v8 = [v7 App];
  v9 = [v8 InFocus];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v3 endDate:0 maxEvents:0 lastN:0 reversed:0];
  uint64_t v11 = *MEMORY[0x1E4F4B5A0];
  v12 = [v6 publisherWithUseCase:*MEMORY[0x1E4F4B5A0] options:v10];
  v13 = [v9 publisherWithUseCase:v11 options:v10];
  v14 = [(ATXInterruptingNotificationsAccumulator *)self initWithNotificationPublisher:v12 appLaunchPublisher:v13];

  return v14;
}

- (ATXInterruptingNotificationsAccumulator)initWithNotificationPublisher:(id)a3 appLaunchPublisher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXInterruptingNotificationsAccumulator;
  v9 = [(ATXInterruptingNotificationsAccumulator *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    interruptingNotifications = v9->_interruptingNotifications;
    v9->_interruptingNotifications = (ATXInterruptingNotificationsHelper *)v10;

    objc_storeStrong((id *)&v9->_notificationPublisher, a3);
    objc_storeStrong((id *)&v9->_appLaunchPublisher, a4);
  }

  return v9;
}

- (BOOL)successfullyAccumulatedInterruptingSessions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v4 = +[_ATXAppIconState sharedInstance];
  v5 = [v4 allInstalledAppsKnownToSpringBoard];
  v6 = (void *)[v3 initWithArray:v5];

  id v7 = [(BPSPublisher *)self->_notificationPublisher orderedMergeWithOther:self->_appLaunchPublisher comparator:&__block_literal_global_179];
  uint64_t v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x3032000000;
  v20[2] = __Block_byref_object_copy__84;
  v20[3] = __Block_byref_object_dispose__84;
  id v21 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__ATXInterruptingNotificationsAccumulator_successfullyAccumulatedInterruptingSessions__block_invoke_10;
  v18[3] = &unk_1E68AC060;
  v18[4] = &v19;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__ATXInterruptingNotificationsAccumulator_successfullyAccumulatedInterruptingSessions__block_invoke_2;
  v15[3] = &unk_1E68AD360;
  id v8 = v6;
  id v16 = v8;
  v17 = self;
  id v9 = (id)[v7 sinkWithCompletion:v18 receiveInput:v15];
  uint64_t v10 = *(void *)(v20[0] + 40);
  if (v10)
  {
    p_super = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      [(ATXInterruptingNotificationsAccumulator *)(uint64_t)v20 successfullyAccumulatedInterruptingSessions];
    }
  }
  else
  {
    v12 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[ATXInterruptingNotificationsAccumulator successfullyAccumulatedInterruptingSessions]";
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "%s: Successfully accumulated interrupting app session events", buf, 0xCu);
    }

    objc_super v13 = [(ATXInterruptingNotificationsHelper *)self->_interruptingNotifications interruptingAppsessions];
    p_super = &self->_allInterruptingAppSessions->super;
    self->_allInterruptingAppSessions = v13;
  }

  _Block_object_dispose(&v19, 8);
  return v10 == 0;
}

uint64_t __86__ATXInterruptingNotificationsAccumulator_successfullyAccumulatedInterruptingSessions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __86__ATXInterruptingNotificationsAccumulator_successfullyAccumulatedInterruptingSessions__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __86__ATXInterruptingNotificationsAccumulator_successfullyAccumulatedInterruptingSessions__block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v5 = [v12 eventBody];
  v6 = v5;
  if (isKindOfClass)
  {
    id v7 = *(void **)(a1 + 32);
    double v8 = [v5 bundleID];
    LODWORD(v7) = [v7 containsObject:v8];

    if (v7 && [v6 usageType] == 17) {
      [*(id *)(*(void *)(a1 + 40) + 8) checkNotificationEvent:v6];
    }
  }
  else
  {
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) == 0) {
      goto LABEL_12;
    }
    v6 = [v12 eventBody];
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v6 bundleID];
    LODWORD(v10) = [v10 containsObject:v11];

    if (v10)
    {
      if ([v6 starting]) {
        [*(id *)(*(void *)(a1 + 40) + 8) checkAppLaunchStartEvent:v6];
      }
      if (([v6 starting] & 1) == 0) {
        [*(id *)(*(void *)(a1 + 40) + 8) checkAppLaunchEndEvent:v6];
      }
    }
  }

LABEL_12:
}

- (NSArray)allInterruptingAppSessions
{
  return self->_allInterruptingAppSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allInterruptingAppSessions, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_notificationPublisher, 0);
  objc_storeStrong((id *)&self->_interruptingNotifications, 0);
}

- (void)successfullyAccumulatedInterruptingSessions
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  uint64_t v4 = "-[ATXInterruptingNotificationsAccumulator successfullyAccumulatedInterruptingSessions]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: Error with reading merged notifications and app launch streams: %@", (uint8_t *)&v3, 0x16u);
}

@end