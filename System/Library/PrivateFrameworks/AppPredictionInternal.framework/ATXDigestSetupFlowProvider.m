@interface ATXDigestSetupFlowProvider
- (ATXDigestSetupFlowProvider)init;
- (ATXDigestSetupFlowProvider)initWithDatastore:(id)a3;
- (BOOL)containsMessageAndTimeSensitiveData;
- (id)appsSortedByNumOfNotificationsGivenNumOfDays:(unint64_t)a3;
- (unint64_t)numDaysOfData;
- (unint64_t)numDaysSinceTimestamp:(double)a3;
- (void)addRemainingAppsWithNoNotificationVolume:(id)a3;
- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3;
- (void)setContainsMessageAndTimeSensitiveData:(BOOL)a3;
- (void)setNumDaysOfData:(unint64_t)a3;
@end

@implementation ATXDigestSetupFlowProvider

- (ATXDigestSetupFlowProvider)init
{
  v3 = objc_opt_new();
  v4 = [(ATXDigestSetupFlowProvider *)self initWithDatastore:v3];

  return v4;
}

- (ATXDigestSetupFlowProvider)initWithDatastore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXDigestSetupFlowProvider;
  v6 = [(ATXDigestSetupFlowProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_datastore, a3);
    v7->_containsMessageAndTimeSensitiveData = 1;
    v7->_numDaysOfData = 0;
  }

  return v7;
}

- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3
{
}

- (id)appsSortedByNumOfNotificationsGivenNumOfDays:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(ATXNotificationAndSuggestionDatastore *)self->_datastore receiveTimeStampOfFirstNotification];
  double v6 = v5;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7 - (double)(86400 * a3);
  objc_super v9 = __atxlog_handle_notification_management();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6 == 0.0)
  {
    if (v10)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Notifications database was empty", (uint8_t *)&v17, 2u);
    }

    unint64_t v11 = 0;
  }
  else
  {
    if (v10)
    {
      v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v6];
      int v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "First notification in the database was on: %@", (uint8_t *)&v17, 0xCu);
    }
    unint64_t v11 = [(ATXDigestSetupFlowProvider *)self numDaysSinceTimestamp:v6];
  }
  self->_numDaysOfData = v11;
  v13 = [(ATXNotificationAndSuggestionDatastore *)self->_datastore appSortedByNumOfNotificationsSinceTimestamp:v8];
  v14 = (void *)[v13 mutableCopy];

  [(ATXDigestSetupFlowProvider *)self addRemainingAppsWithNoNotificationVolume:v14];
  v15 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ATXDigestSetupFlowProvider appsSortedByNumOfNotificationsGivenNumOfDays:](v14, v15);
  }

  return v14;
}

- (unint64_t)numDaysSinceTimestamp:(double)a3
{
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  double v6 = [MEMORY[0x1E4F1C9C8] now];
  double v7 = [v4 components:16 fromDate:v5 toDate:v6 options:2];

  unint64_t v8 = [v7 day] + 1;
  return v8;
}

- (void)addRemainingAppsWithNoNotificationVolume:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[_ATXAppIconState sharedInstance];
  double v5 = (void *)MEMORY[0x1E4F1CA80];
  double v6 = [v4 allAppsKnownToSpringBoard];
  double v7 = [v5 setWithArray:v6];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v14 = [v13 bundleId];
        int v15 = [v7 containsObject:v14];

        if (v15)
        {
          v16 = [v13 bundleId];
          [v7 removeObject:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  int v17 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v7;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        id v24 = objc_alloc(MEMORY[0x1E4F4AEA8]);
        v25 = objc_msgSend(v24, "initWithBundleId:numBasicNotifications:numMessageNotifications:numTimeSenstiveNonMessageNotifications:", v23, 0, 0, 0, (void)v26);
        [v17 addObject:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  [v8 addObjectsFromArray:v17];
}

- (BOOL)containsMessageAndTimeSensitiveData
{
  return self->_containsMessageAndTimeSensitiveData;
}

- (void)setContainsMessageAndTimeSensitiveData:(BOOL)a3
{
  self->_containsMessageAndTimeSensitiveData = a3;
}

- (unint64_t)numDaysOfData
{
  return self->_numDaysOfData;
}

- (void)setNumDaysOfData:(unint64_t)a3
{
  self->_numDaysOfData = a3;
}

- (void).cxx_destruct
{
}

- (void)appsSortedByNumOfNotificationsGivenNumOfDays:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Total number of apps being returned: %lu", (uint8_t *)&v3, 0xCu);
}

@end