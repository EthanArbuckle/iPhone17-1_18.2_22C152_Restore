@interface ATXContactNotificationEngagementEventProvider
- (ATXContactNotificationEngagementEventProvider)initWithModeEventProvider:(id)a3;
- (ATXModeEvent)mostRecentModeEvent;
- (BOOL)notificationEventOccurredWhileInMode:(id)a3 modeTransitionEvent:(id)a4;
- (BOOL)successfullyCalculatedNotificationEvents;
- (double)classConditionalOfNotificationsClearedForContactId:(id)a3;
- (double)classConditionalOfNotificationsReceivedForContactId:(id)a3;
- (double)globalNotificationsClearedRateForContactId:(id)a3;
- (double)globalPopularityOfNotificationsReceivedForContactId:(id)a3;
- (double)localNotificationsClearedRateForContactId:(id)a3;
- (double)localPopularityOfNotificationsReceivedForContactId:(id)a3;
- (double)ratioOfLocalToGlobalNotificationsClearedRateForContactId:(id)a3;
- (double)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForContactId:(id)a3;
- (id)dateIntervalFromNotificationEvent:(id)a3;
- (unint64_t)globalCountOfNotificationsCleared;
- (unint64_t)globalCountOfNotificationsClearedForContactId:(id)a3;
- (unint64_t)globalCountOfNotificationsReceived;
- (unint64_t)globalCountOfNotificationsReceivedForContactId:(id)a3;
- (unint64_t)modeCountOfNotificationsCleared;
- (unint64_t)modeCountOfNotificationsClearedForContactId:(id)a3;
- (unint64_t)modeCountOfNotificationsReceived;
- (unint64_t)modeCountOfNotificationsReceivedForContactId:(id)a3;
- (void)successfullyCalculatedNotificationEvents;
- (void)trackNewModeEvent:(id)a3;
- (void)trackNewNotificationEvent:(id)a3;
@end

@implementation ATXContactNotificationEngagementEventProvider

- (ATXContactNotificationEngagementEventProvider)initWithModeEventProvider:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXContactNotificationEngagementEventProvider;
  v6 = [(ATXContactNotificationEngagementEventProvider *)&v17 init];
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
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  v4 = BiomeLibrary();
  id v5 = [v4 Notification];
  v6 = [v5 Usage];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v3 endDate:0 maxEvents:0 lastN:0 reversed:0];
  v8 = [v6 publisherWithUseCase:*MEMORY[0x1E4F4B5A0] options:v7];
  v9 = [(ATXModeEntityEventProviderProtocol *)self->_modeEventProvider biomePublisherWithBookmark:0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke;
  v26[3] = &unk_1E68AC7A0;
  v26[4] = self;
  v10 = [v9 orderedMergeWithOther:v8 comparator:v26];

  uint64_t v23 = 0;
  v24[0] = &v23;
  v24[1] = 0x3032000000;
  v24[2] = __Block_byref_object_copy__103;
  v24[3] = __Block_byref_object_dispose__103;
  id v25 = 0;
  v21[4] = self;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_14;
  v22[3] = &unk_1E68AC060;
  v22[4] = &v23;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_2;
  v21[3] = &unk_1E68B4650;
  id v11 = (id)[v10 sinkWithCompletion:v22 receiveInput:v21];
  uint64_t v12 = *(void *)(v24[0] + 40);
  if (v12)
  {
    v13 = __atxlog_handle_modes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(ATXContactNotificationEngagementEventProvider *)(uint64_t)v24 successfullyCalculatedNotificationEvents];
    }
  }
  _Block_object_dispose(&v23, 8);

  return v12 == 0;
}

uint64_t __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke(uint64_t a1, void *a2, void *a3)
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

  id v11 = [*(id *)(*(void *)(a1 + 32) + 8) dateIntervalFromEvent:v6];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) dateIntervalFromNotificationEvent:v6];
  }
  uint64_t v14 = v13;

  if (v10)
  {
    if (v14) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  uint64_t v15 = __atxlog_handle_modes();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1((uint64_t)v5, v15, v16, v17, v18, v19, v20, v21);
  }

  if (!v14)
  {
LABEL_13:
    v22 = __atxlog_handle_modes();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1((uint64_t)v6, v22, v23, v24, v25, v26, v27, v28);
    }
  }
LABEL_16:
  v29 = [v10 startDate];
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

uint64_t __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) aggregationEventsFromEvent:v3];
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
      [*(id *)(a1 + 32) trackNewNotificationEvent:v5];
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
      id v11 = (void *)[v8 initWithStartDate:v9 endDate:v10];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)trackNewModeEvent:(id)a3
{
}

- (void)trackNewNotificationEvent:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 eventBody];
  if ([v4 usageType] == 4)
  {
    id v5 = [v4 contactIDs];

    if (v5)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v6 = [v4 contactIDs];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v40;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v40 != v9) {
              objc_enumerationMutation(v6);
            }
            [(NSCountedSet *)self->_globalCountOfNotificationsCleared addObject:*(void *)(*((void *)&v39 + 1) + 8 * v10++)];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
        }
        while (v8);
      }

      if ([(ATXContactNotificationEngagementEventProvider *)self notificationEventOccurredWhileInMode:v4 modeTransitionEvent:self->_mostRecentModeEvent])
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v11 = [v4 contactIDs];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v36;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v36 != v14) {
                objc_enumerationMutation(v11);
              }
              [(NSCountedSet *)self->_modeCountOfNotificationsCleared addObject:*(void *)(*((void *)&v35 + 1) + 8 * v15++)];
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
          }
          while (v13);
        }
      }
    }
  }
  if ([v4 usageType] == 17 || objc_msgSend(v4, "usageType") == 18)
  {
    uint64_t v16 = [v4 contactIDs];

    if (v16)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v17 = [v4 contactIDs];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v32;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(v17);
            }
            [(NSCountedSet *)self->_globalCountOfNotificationsReceived addObject:*(void *)(*((void *)&v31 + 1) + 8 * v21++)];
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
        }
        while (v19);
      }

      if ([(ATXContactNotificationEngagementEventProvider *)self notificationEventOccurredWhileInMode:v4 modeTransitionEvent:self->_mostRecentModeEvent])
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v22 = objc_msgSend(v4, "contactIDs", 0);
        uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v28;
          do
          {
            uint64_t v26 = 0;
            do
            {
              if (*(void *)v28 != v25) {
                objc_enumerationMutation(v22);
              }
              [(NSCountedSet *)self->_modeCountOfNotificationsReceived addObject:*(void *)(*((void *)&v27 + 1) + 8 * v26++)];
            }
            while (v24 != v26);
            uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
          }
          while (v24);
        }
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
  uint64_t v10 = [v6 startDate];
  [v10 timeIntervalSince1970];
  if (v9 <= v11)
  {
    BOOL v17 = 0;
  }
  else
  {
    uint64_t v12 = [v5 absoluteTimestamp];
    [v12 timeIntervalSince1970];
    double v14 = v13;
    uint64_t v15 = [v6 endDate];
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

- (unint64_t)globalCountOfNotificationsClearedForContactId:(id)a3
{
  return [(NSCountedSet *)self->_globalCountOfNotificationsCleared countForObject:a3];
}

- (unint64_t)modeCountOfNotificationsClearedForContactId:(id)a3
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

- (double)localNotificationsClearedRateForContactId:(id)a3
{
  unint64_t v4 = [(ATXContactNotificationEngagementEventProvider *)self modeCountOfNotificationsClearedForContactId:a3];
  unint64_t v5 = [(ATXContactNotificationEngagementEventProvider *)self modeCountOfNotificationsCleared];
  double result = 0.0;
  if (v4)
  {
    if (v5) {
      return (double)v4 / (double)v5;
    }
  }
  return result;
}

- (double)globalNotificationsClearedRateForContactId:(id)a3
{
  unint64_t v4 = [(ATXContactNotificationEngagementEventProvider *)self globalCountOfNotificationsClearedForContactId:a3];
  unint64_t v5 = [(ATXContactNotificationEngagementEventProvider *)self globalCountOfNotificationsCleared];
  double result = 0.0;
  if (v4)
  {
    if (v5) {
      return (double)v4 / (double)v5;
    }
  }
  return result;
}

- (double)ratioOfLocalToGlobalNotificationsClearedRateForContactId:(id)a3
{
  id v4 = a3;
  [(ATXContactNotificationEngagementEventProvider *)self localNotificationsClearedRateForContactId:v4];
  double v6 = v5;
  [(ATXContactNotificationEngagementEventProvider *)self globalNotificationsClearedRateForContactId:v4];
  double v8 = v7;

  double result = 0.0;
  if (v8 != 0.0 && v6 != 0.0) {
    return v6 / v8;
  }
  return result;
}

- (double)classConditionalOfNotificationsClearedForContactId:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ATXContactNotificationEngagementEventProvider *)self modeCountOfNotificationsClearedForContactId:v4];
  unint64_t v6 = [(ATXContactNotificationEngagementEventProvider *)self globalCountOfNotificationsClearedForContactId:v4];

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

- (unint64_t)globalCountOfNotificationsReceivedForContactId:(id)a3
{
  return [(NSCountedSet *)self->_globalCountOfNotificationsReceived countForObject:a3];
}

- (unint64_t)modeCountOfNotificationsReceivedForContactId:(id)a3
{
  return [(NSCountedSet *)self->_modeCountOfNotificationsReceived countForObject:a3];
}

- (double)globalPopularityOfNotificationsReceivedForContactId:(id)a3
{
  unint64_t v4 = [(ATXContactNotificationEngagementEventProvider *)self globalCountOfNotificationsReceivedForContactId:a3];
  unint64_t v5 = [(ATXContactNotificationEngagementEventProvider *)self globalCountOfNotificationsReceived];
  double result = 0.0;
  if (v4)
  {
    if (v5) {
      return (double)v4 / (double)v5;
    }
  }
  return result;
}

- (double)localPopularityOfNotificationsReceivedForContactId:(id)a3
{
  unint64_t v4 = [(ATXContactNotificationEngagementEventProvider *)self modeCountOfNotificationsReceivedForContactId:a3];
  unint64_t v5 = [(ATXContactNotificationEngagementEventProvider *)self modeCountOfNotificationsReceived];
  double result = 0.0;
  if (v4)
  {
    if (v5) {
      return (double)v4 / (double)v5;
    }
  }
  return result;
}

- (double)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForContactId:(id)a3
{
  id v4 = a3;
  [(ATXContactNotificationEngagementEventProvider *)self localPopularityOfNotificationsReceivedForContactId:v4];
  double v6 = v5;
  [(ATXContactNotificationEngagementEventProvider *)self globalPopularityOfNotificationsReceivedForContactId:v4];
  double v8 = v7;

  double result = 0.0;
  if (v8 != 0.0 && v6 != 0.0) {
    return v6 / v8;
  }
  return result;
}

- (double)classConditionalOfNotificationsReceivedForContactId:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ATXContactNotificationEngagementEventProvider *)self modeCountOfNotificationsReceivedForContactId:v4];
  unint64_t v6 = [(ATXContactNotificationEngagementEventProvider *)self globalCountOfNotificationsReceivedForContactId:v4];

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

void __89__ATXContactNotificationEngagementEventProvider_successfullyCalculatedNotificationEvents__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end