@interface ATXNotificationEventProvider
- (ATXNotificationEventProvider)initWithEventType:(int64_t)a3 contactStore:(id)a4;
- (ATXNotificationEventProvider)initWithEventTypes:(id)a3 contactStore:(id)a4;
- (BOOL)isEventFromProvider:(id)a3;
- (BOOL)publisherIsCoreDuetWrapper;
- (NSString)description;
- (double)secondsSinceReceiptForModeEvent:(id)a3;
- (id)aggregationEventsFromEvent:(id)a3;
- (id)biomePublisherWithBookmark:(id)a3;
- (id)dateIntervalFromEvent:(id)a3;
- (id)eventsFromPublisher;
- (void)updateEntitySpecificFeaturesDict:(id)a3 aggregationEvent:(id)a4 isLocalToMode:(BOOL)a5;
@end

@implementation ATXNotificationEventProvider

- (ATXNotificationEventProvider)initWithEventType:(int64_t)a3 contactStore:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v6 = NSNumber;
  id v7 = a4;
  v8 = [v6 numberWithInteger:a3];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10 = [(ATXNotificationEventProvider *)self initWithEventTypes:v9 contactStore:v7];

  return v10;
}

- (ATXNotificationEventProvider)initWithEventTypes:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXNotificationEventProvider;
  v9 = [(ATXNotificationEventProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventTypes, a3);
    v11 = [[ATXStableContactRepresentationDatastore alloc] initWithContactStore:v8];
    stableContactRepresentationProvider = v10->_stableContactRepresentationProvider;
    v10->_stableContactRepresentationProvider = (ATXStableContactRepresentationProviderProtocol *)v11;
  }
  return v10;
}

- (id)biomePublisherWithBookmark:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", a3, -2419200.0);
  v5 = objc_opt_new();
  v6 = [v5 publisherFromStartTime:v4 endTime:0 maxEvents:0 lastN:2000 reversed:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__ATXNotificationEventProvider_biomePublisherWithBookmark___block_invoke;
  v9[3] = &unk_1E68AF140;
  v9[4] = self;
  id v7 = [v6 filterWithIsIncluded:v9];

  return v7;
}

uint64_t __59__ATXNotificationEventProvider_biomePublisherWithBookmark___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 eventBody];

  if (v4)
  {
    v5 = [v3 eventBody];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __59__ATXNotificationEventProvider_biomePublisherWithBookmark___block_invoke_cold_1();
      }

      id v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3B8];
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      [v7 raise:v8, @"Encountered event in ATXNotificationEventProvider that was of unknown class. Expected ATXUserNotificationLoggingEvent. Received: %@", v10 format];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v16 = [v5 eventType];
          if (v16 == [v15 integerValue])
          {
            uint64_t v12 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)eventsFromPublisher
{
  id v3 = objc_opt_new();
  v4 = [(ATXNotificationEventProvider *)self biomePublisherWithBookmark:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__ATXNotificationEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E68B3490;
  v10[4] = self;
  id v5 = v3;
  id v11 = v5;
  id v6 = (id)[v4 sinkWithCompletion:&__block_literal_global_147 receiveInput:v10];

  id v7 = v11;
  id v8 = v5;

  return v8;
}

void __51__ATXNotificationEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) aggregationEventsFromEvent:a2];
  if ([v3 count]) {
    [*(id *)(a1 + 40) addObjectsFromArray:v3];
  }
}

- (BOOL)publisherIsCoreDuetWrapper
{
  return 1;
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)aggregationEventsFromEvent:(id)a3
{
  id v4 = a3;
  if ([(ATXNotificationEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = [v4 eventBody];
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v5 timestamp];
    id v7 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    id v8 = [v5 notification];
    v9 = [v8 bundleID];

    if (v9)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F4AED8]) initWithBundleId:v9];
      if (v10)
      {
        id v11 = [v5 notification];
        int v12 = [v11 isMessage];

        if (v12)
        {
          uint64_t v13 = [v5 notification];
          int v14 = [v13 isGroupMessage];

          v15 = [v5 notification];
          uint64_t v16 = v15;
          if (v14)
          {
            v17 = [v15 threadID];

            if (v17) {
              long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F4AF60]) initWithDisplayName:0 rawIdentifier:v17 cnContactId:0];
            }
            else {
              long long v18 = 0;
            }
          }
          else
          {
            long long v20 = [v15 contactIDs];
            v17 = [v20 firstObject];

            long long v21 = [v5 notification];
            v22 = [v21 rawIdentifiers];
            uint64_t v23 = [v22 firstObject];

            if (v17)
            {
              v24 = [(ATXStableContactRepresentationProviderProtocol *)self->_stableContactRepresentationProvider stableContactRepresentationForCnContactId:v17 rawIdentifier:v23];
              v25 = [v24 stableContactIdentifier];
              long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F4AF60]) initWithDisplayName:0 rawIdentifier:v23 cnContactId:v17 stableContactIdentifier:v25];
            }
            else
            {
              v26 = __atxlog_handle_notification_management();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                -[ATXNotificationEventProvider aggregationEventsFromEvent:](v5);
              }

              long long v18 = 0;
            }
          }
        }
        else
        {
          long long v18 = 0;
        }
        long long v19 = objc_opt_new();
        v27 = (void *)[objc_alloc(MEMORY[0x1E4F4B1E0]) initWithAppEntity:v10 contactEntity:0];
        v28 = [v5 notification];
        [v28 timestamp];
        objc_msgSend(v27, "setReceiveTimestamp:");

        if (v27)
        {
          v29 = [[ATXModeEvent alloc] initWithStartDate:v7 endDate:v7 entity:v27];
          [v19 addObject:v29];
        }
        if (v18)
        {
          v30 = (void *)[objc_alloc(MEMORY[0x1E4F4B1E0]) initWithAppEntity:v10 contactEntity:v18];

          v31 = [v5 notification];
          [v31 timestamp];
          objc_msgSend(v30, "setReceiveTimestamp:");

          if (v30)
          {
            v32 = [[ATXModeEvent alloc] initWithStartDate:v7 endDate:v7 entity:v30];
            [v19 addObject:v32];
          }
          v27 = (void *)[objc_alloc(MEMORY[0x1E4F4B1E0]) initWithAppEntity:0 contactEntity:v18];

          v33 = [v5 notification];
          [v33 timestamp];
          objc_msgSend(v27, "setReceiveTimestamp:");

          if (v27)
          {
            v34 = [[ATXModeEvent alloc] initWithStartDate:v7 endDate:v7 entity:v27];
            [v19 addObject:v34];
          }
        }
      }
      else
      {
        long long v19 = 0;
      }
    }
    else
    {
      long long v19 = 0;
    }
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4 = a3;
  if ([(ATXNotificationEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = [v4 eventBody];
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v5 timestamp];
    id v7 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)updateEntitySpecificFeaturesDict:(id)a3 aggregationEvent:(id)a4 isLocalToMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v5)
  {
    id v11 = [v9 entity];
    int v12 = [v8 objectForKeyedSubscript:v11];

    if (!v12)
    {
      uint64_t v13 = objc_opt_new();
      int v14 = [v10 entity];
      [v8 setObject:v13 forKeyedSubscript:v14];
    }
    v15 = [v10 entity];
    uint64_t v16 = [v8 objectForKeyedSubscript:v15];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [v16 secondsToEngagement];
      long long v18 = NSNumber;
      [(ATXNotificationEventProvider *)self secondsSinceReceiptForModeEvent:v10];
      long long v19 = objc_msgSend(v18, "numberWithDouble:");
      [v17 addObject:v19];
    }
    else
    {
      long long v20 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationEventProvider updateEntitySpecificFeaturesDict:aggregationEvent:isLocalToMode:]((uint64_t)v16, v20);
      }
    }
  }
}

- (double)secondsSinceReceiptForModeEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 entity];
  BOOL v5 = [v3 startDate];

  id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v4 receiveTimestamp];
  id v7 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  [v5 timeIntervalSinceDate:v7];
  double v9 = v8;

  return v9;
}

- (NSString)description
{
  id v3 = objc_opt_new();
  eventTypes = self->_eventTypes;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ATXNotificationEventProvider_description__block_invoke;
  v7[3] = &unk_1E68B34B8;
  id v5 = v3;
  id v8 = v5;
  [(NSArray *)eventTypes enumerateObjectsUsingBlock:v7];

  return (NSString *)v5;
}

void __43__ATXNotificationEventProvider_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@"-"];
  }
  [v6 integerValue];
  id v5 = ATXNEventTypeToString();
  [*(id *)(a1 + 32) appendString:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableContactRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_eventTypes, 0);
}

void __59__ATXNotificationEventProvider_biomePublisherWithBookmark___block_invoke_cold_1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "Encountered event in ATXNotificationEventProvider that was of unknown class. Expected ATXUserNotificationLoggingEvent. Received: %@", v4, v5, v6, v7, 2u);
}

- (void)aggregationEventsFromEvent:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 notification];
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "Notification didn't have a contactId, although it was a message and wasn't a group message. Notification: %@", v4, v5, v6, v7, 2u);
}

- (void)updateEntitySpecificFeaturesDict:(uint64_t)a1 aggregationEvent:(NSObject *)a2 isLocalToMode:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Encountered an event of unknown type. Expected ATXNotificationEntityFeatures, received: %@", (uint8_t *)&v5, 0xCu);
}

@end