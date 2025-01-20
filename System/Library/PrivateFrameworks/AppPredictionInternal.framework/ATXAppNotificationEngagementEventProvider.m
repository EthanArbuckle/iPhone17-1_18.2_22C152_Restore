@interface ATXAppNotificationEngagementEventProvider
- (ATXAppNotificationEngagementEventProvider)initWithModeEventProvider:(id)a3;
- (ATXModeEvent)mostRecentModeEvent;
- (BOOL)notificationEventOccurredWhileInMode:(id)a3 modeTransitionEvent:(id)a4;
- (BOOL)successfullyCalculatedNotificationEvents;
- (double)classConditionalOfNotificationsClearedForBundleId:(id)a3;
- (double)classConditionalOfNotificationsReceivedForBundleId:(id)a3;
- (double)globalNotificationsClearedRateForBundleId:(id)a3;
- (double)globalPopularityOfNotificationsReceivedForBundleId:(id)a3;
- (double)localNotificationsClearedRateForBundleId:(id)a3;
- (double)localPopularityOfNotificationsReceivedForBundleId:(id)a3;
- (double)ratioOfLocalToGlobalNotificationsClearedRateForBundleId:(id)a3;
- (double)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForBundleId:(id)a3;
- (id)dateIntervalFromNotificationEvent:(id)a3;
- (unint64_t)globalCountOfNotificationsCleared;
- (unint64_t)globalCountOfNotificationsClearedForBundleId:(id)a3;
- (unint64_t)globalCountOfNotificationsReceived;
- (unint64_t)globalCountOfNotificationsReceivedForBundleId:(id)a3;
- (unint64_t)modeCountOfNotificationsCleared;
- (unint64_t)modeCountOfNotificationsClearedForBundleId:(id)a3;
- (unint64_t)modeCountOfNotificationsReceived;
- (unint64_t)modeCountOfNotificationsReceivedForBundleId:(id)a3;
- (void)successfullyCalculatedNotificationEvents;
- (void)trackNewModeEvent:(id)a3;
- (void)trackNewNotificationEvent:(id)a3 forInstalledApps:(id)a4;
@end

@implementation ATXAppNotificationEngagementEventProvider

- (ATXAppNotificationEngagementEventProvider)initWithModeEventProvider:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXAppNotificationEngagementEventProvider;
  v6 = [(ATXAppNotificationEngagementEventProvider *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modeEventProvider, a3);
    v8 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    modeCountOfNotificationsCleared = v7->_modeCountOfNotificationsCleared;
    v7->_modeCountOfNotificationsCleared = v8;

    v10 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    globalCountOfNotificationsCleared = v7->_globalCountOfNotificationsCleared;
    v7->_globalCountOfNotificationsCleared = v10;

    v12 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    modeCountOfNotificationsReceived = v7->_modeCountOfNotificationsReceived;
    v7->_modeCountOfNotificationsReceived = v12;

    v14 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    globalCountOfNotificationsReceived = v7->_globalCountOfNotificationsReceived;
    v7->_globalCountOfNotificationsReceived = v14;
  }
  return v7;
}

- (BOOL)successfullyCalculatedNotificationEvents
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v4 = +[_ATXAppIconState sharedInstance];
  id v5 = [v4 allInstalledAppsKnownToSpringBoard];
  v6 = (void *)[v3 initWithArray:v5];

  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  v8 = BiomeLibrary();
  v9 = [v8 Notification];
  v10 = [v9 Usage];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v7 endDate:0 maxEvents:0 lastN:0 reversed:0];
  v12 = [v10 publisherWithUseCase:*MEMORY[0x1E4F4B5A0] options:v11];
  v13 = [(ATXModeEntityEventProviderProtocol *)self->_modeEventProvider biomePublisherWithBookmark:0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke;
  v32[3] = &unk_1E68AC7A0;
  v32[4] = self;
  v14 = [v13 orderedMergeWithOther:v12 comparator:v32];

  uint64_t v29 = 0;
  v30[0] = &v29;
  v30[1] = 0x3032000000;
  v30[2] = __Block_byref_object_copy__19;
  v30[3] = __Block_byref_object_dispose__19;
  id v31 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_16;
  v28[3] = &unk_1E68AC060;
  v28[4] = &v29;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_2;
  v26[3] = &unk_1E68AD7A8;
  v26[4] = self;
  id v15 = v6;
  id v27 = v15;
  id v16 = (id)[v14 sinkWithCompletion:v28 receiveInput:v26];
  uint64_t v17 = *(void *)(v30[0] + 40);
  if (v17)
  {
    v18 = __atxlog_handle_modes();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(ATXAppNotificationEngagementEventProvider *)(uint64_t)v30 successfullyCalculatedNotificationEvents];
    }
  }
  _Block_object_dispose(&v29, 8);

  return v17 == 0;
}

uint64_t __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(*(void *)(a1 + 32) + 8) dateIntervalFromEvent:v5];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) dateIntervalFromNotificationEvent:v5];
  }
  v10 = v9;

  v11 = [*(id *)(*(void *)(a1 + 32) + 8) dateIntervalFromEvent:v6];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) dateIntervalFromNotificationEvent:v6];
  }
  v14 = v13;

  if (v10)
  {
    if (v14) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  id v15 = __atxlog_handle_modes();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1((uint64_t)v5, v15, v16, v17, v18, v19, v20, v21);
  }

  if (!v14)
  {
LABEL_13:
    uint64_t v22 = __atxlog_handle_modes();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1((uint64_t)v6, v22, v23, v24, v25, v26, v27, v28);
    }
  }
LABEL_16:
  uint64_t v29 = [v10 startDate];
  [v29 timeIntervalSinceReferenceDate];
  double v31 = v30;

  v32 = [v14 startDate];
  [v32 timeIntervalSinceReferenceDate];
  double v34 = v33;

  v35 = [NSNumber numberWithDouble:v31];
  v36 = [NSNumber numberWithDouble:v34];
  uint64_t v37 = [v35 compare:v36];

  return v37;
}

uint64_t __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_16(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];
  return MEMORY[0x1F41817F8]();
}

void __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(*(void *)(a1 + 32) + 8) aggregationEventsFromEvent:v3];
  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(a1 + 32), "trackNewModeEvent:", *(void *)(*((void *)&v12 + 1) + 8 * v9++), (void)v12);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v5 = v3;
    v10 = [v5 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [*(id *)(a1 + 32) trackNewNotificationEvent:v5 forInstalledApps:*(void *)(a1 + 40)];
    }
  }

LABEL_10:
}

- (id)dateIntervalFromNotificationEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = [v4 eventBody];
      id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
      uint64_t v9 = [v7 absoluteTimestamp];
      v10 = [v7 absoluteTimestamp];
      v11 = (void *)[v8 initWithStartDate:v9 endDate:v10];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)trackNewModeEvent:(id)a3
{
}

- (void)trackNewNotificationEvent:(id)a3 forInstalledApps:(id)a4
{
  id v6 = a4;
  id v17 = [a3 eventBody];
  uint64_t v7 = [v17 bundleID];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    if ([v17 usageType] == 4)
    {
      globalCountOfNotificationsCleared = self->_globalCountOfNotificationsCleared;
      v10 = [v17 bundleID];
      [(NSCountedSet *)globalCountOfNotificationsCleared addObject:v10];

      if ([(ATXAppNotificationEngagementEventProvider *)self notificationEventOccurredWhileInMode:v17 modeTransitionEvent:self->_mostRecentModeEvent])
      {
        modeCountOfNotificationsCleared = self->_modeCountOfNotificationsCleared;
        long long v12 = [v17 bundleID];
        [(NSCountedSet *)modeCountOfNotificationsCleared addObject:v12];
      }
    }
    if ([v17 usageType] == 17 || objc_msgSend(v17, "usageType") == 18)
    {
      globalCountOfNotificationsReceived = self->_globalCountOfNotificationsReceived;
      long long v14 = [v17 bundleID];
      [(NSCountedSet *)globalCountOfNotificationsReceived addObject:v14];

      if ([(ATXAppNotificationEngagementEventProvider *)self notificationEventOccurredWhileInMode:v17 modeTransitionEvent:self->_mostRecentModeEvent])
      {
        modeCountOfNotificationsReceived = self->_modeCountOfNotificationsReceived;
        uint64_t v16 = [v17 bundleID];
        [(NSCountedSet *)modeCountOfNotificationsReceived addObject:v16];
      }
    }
  }
}

- (BOOL)notificationEventOccurredWhileInMode:(id)a3 modeTransitionEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 absoluteTimestamp];
  [v7 timeIntervalSince1970];
  double v9 = v8;
  v10 = [v6 startDate];
  [v10 timeIntervalSince1970];
  if (v9 <= v11)
  {
    BOOL v17 = 0;
  }
  else
  {
    long long v12 = [v5 absoluteTimestamp];
    [v12 timeIntervalSince1970];
    double v14 = v13;
    long long v15 = [v6 endDate];
    [v15 timeIntervalSince1970];
    BOOL v17 = v14 < v16;
  }
  return v17;
}

- (unint64_t)globalCountOfNotificationsCleared
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_globalCountOfNotificationsCleared;
  uint64_t v4 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += -[NSCountedSet countForObject:](self->_globalCountOfNotificationsCleared, "countForObject:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v5 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)globalCountOfNotificationsClearedForBundleId:(id)a3
{
  return [(NSCountedSet *)self->_globalCountOfNotificationsCleared countForObject:a3];
}

- (unint64_t)modeCountOfNotificationsClearedForBundleId:(id)a3
{
  return [(NSCountedSet *)self->_modeCountOfNotificationsCleared countForObject:a3];
}

- (unint64_t)modeCountOfNotificationsCleared
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_modeCountOfNotificationsCleared;
  uint64_t v4 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += -[NSCountedSet countForObject:](self->_modeCountOfNotificationsCleared, "countForObject:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v5 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (double)localNotificationsClearedRateForBundleId:(id)a3
{
  unint64_t v4 = [(ATXAppNotificationEngagementEventProvider *)self modeCountOfNotificationsClearedForBundleId:a3];
  unint64_t v5 = [(ATXAppNotificationEngagementEventProvider *)self modeCountOfNotificationsCleared];
  double result = 0.0;
  if (v4)
  {
    if (v5) {
      return (double)v4 / (double)v5;
    }
  }
  return result;
}

- (double)globalNotificationsClearedRateForBundleId:(id)a3
{
  unint64_t v4 = [(ATXAppNotificationEngagementEventProvider *)self globalCountOfNotificationsClearedForBundleId:a3];
  unint64_t v5 = [(ATXAppNotificationEngagementEventProvider *)self globalCountOfNotificationsCleared];
  double result = 0.0;
  if (v4)
  {
    if (v5) {
      return (double)v4 / (double)v5;
    }
  }
  return result;
}

- (double)ratioOfLocalToGlobalNotificationsClearedRateForBundleId:(id)a3
{
  id v4 = a3;
  [(ATXAppNotificationEngagementEventProvider *)self localNotificationsClearedRateForBundleId:v4];
  double v6 = v5;
  [(ATXAppNotificationEngagementEventProvider *)self globalNotificationsClearedRateForBundleId:v4];
  double v8 = v7;

  double result = 0.0;
  if (v8 != 0.0 && v6 != 0.0) {
    return v6 / v8;
  }
  return result;
}

- (double)classConditionalOfNotificationsClearedForBundleId:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ATXAppNotificationEngagementEventProvider *)self modeCountOfNotificationsClearedForBundleId:v4];
  unint64_t v6 = [(ATXAppNotificationEngagementEventProvider *)self globalCountOfNotificationsClearedForBundleId:v4];

  double result = 0.0;
  if (v5)
  {
    if (v6) {
      return (double)v5 / (double)v6;
    }
  }
  return result;
}

- (unint64_t)globalCountOfNotificationsReceived
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_globalCountOfNotificationsReceived;
  uint64_t v4 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += -[NSCountedSet countForObject:](self->_globalCountOfNotificationsReceived, "countForObject:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v5 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)modeCountOfNotificationsReceived
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_modeCountOfNotificationsReceived;
  uint64_t v4 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += -[NSCountedSet countForObject:](self->_modeCountOfNotificationsReceived, "countForObject:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v5 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)globalCountOfNotificationsReceivedForBundleId:(id)a3
{
  return [(NSCountedSet *)self->_globalCountOfNotificationsReceived countForObject:a3];
}

- (unint64_t)modeCountOfNotificationsReceivedForBundleId:(id)a3
{
  return [(NSCountedSet *)self->_modeCountOfNotificationsReceived countForObject:a3];
}

- (double)globalPopularityOfNotificationsReceivedForBundleId:(id)a3
{
  unint64_t v4 = [(ATXAppNotificationEngagementEventProvider *)self globalCountOfNotificationsReceivedForBundleId:a3];
  unint64_t v5 = [(ATXAppNotificationEngagementEventProvider *)self globalCountOfNotificationsReceived];
  double result = 0.0;
  if (v4)
  {
    if (v5) {
      return (double)v4 / (double)v5;
    }
  }
  return result;
}

- (double)localPopularityOfNotificationsReceivedForBundleId:(id)a3
{
  unint64_t v4 = [(ATXAppNotificationEngagementEventProvider *)self modeCountOfNotificationsReceivedForBundleId:a3];
  unint64_t v5 = [(ATXAppNotificationEngagementEventProvider *)self modeCountOfNotificationsReceived];
  double result = 0.0;
  if (v4)
  {
    if (v5) {
      return (double)v4 / (double)v5;
    }
  }
  return result;
}

- (double)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForBundleId:(id)a3
{
  id v4 = a3;
  [(ATXAppNotificationEngagementEventProvider *)self localPopularityOfNotificationsReceivedForBundleId:v4];
  double v6 = v5;
  [(ATXAppNotificationEngagementEventProvider *)self globalPopularityOfNotificationsReceivedForBundleId:v4];
  double v8 = v7;

  double result = 0.0;
  if (v8 != 0.0 && v6 != 0.0) {
    return v6 / v8;
  }
  return result;
}

- (double)classConditionalOfNotificationsReceivedForBundleId:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ATXAppNotificationEngagementEventProvider *)self modeCountOfNotificationsReceivedForBundleId:v4];
  unint64_t v6 = [(ATXAppNotificationEngagementEventProvider *)self globalCountOfNotificationsReceivedForBundleId:v4];

  double result = 0.0;
  if (v5)
  {
    if (v6) {
      return (double)v5 / (double)v6;
    }
  }
  return result;
}

- (ATXModeEvent)mostRecentModeEvent
{
  return self->_mostRecentModeEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentModeEvent, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsReceived, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsReceived, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsCleared, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsCleared, 0);
  objc_storeStrong((id *)&self->_modeEventProvider, 0);
}

- (void)successfullyCalculatedNotificationEvents
{
}

void __85__ATXAppNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end