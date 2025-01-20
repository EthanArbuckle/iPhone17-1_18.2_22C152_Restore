@interface ATXFakeModeEventProvider
- (ATXFakeModeEventProvider)initWithEventDateIntervals:(id)a3;
- (ATXFakeModeEventProvider)initWithModeEvents:(id)a3 expectsNilEntity:(BOOL)a4;
- (BOOL)isEventFromProvider:(id)a3;
- (BOOL)publisherIsCoreDuetWrapper;
- (NSString)description;
- (id)aggregationEventsFromEvent:(id)a3;
- (id)biomePublisherWithBookmark:(id)a3;
- (id)dateIntervalFromEvent:(id)a3;
- (id)eventsFromPublisher;
- (void)updateEntitySpecificFeaturesDict:(id)a3 aggregationEvent:(id)a4 isLocalToMode:(BOOL)a5;
@end

@implementation ATXFakeModeEventProvider

- (ATXFakeModeEventProvider)initWithEventDateIntervals:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "startDate", (void)v17);
        v13 = [v11 endDate];
        v14 = [[ATXModeEvent alloc] initWithStartDate:v12 endDate:v13];
        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v15 = [(ATXFakeModeEventProvider *)self initWithModeEvents:v5 expectsNilEntity:1];
  return v15;
}

- (ATXFakeModeEventProvider)initWithModeEvents:(id)a3 expectsNilEntity:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXFakeModeEventProvider;
  uint64_t v8 = [(ATXFakeModeEventProvider *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modeEvents, a3);
    v9->_wasInitializedWithoutEntity = a4;
  }

  return v9;
}

- (id)biomePublisherWithBookmark:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = self->_modeEvents;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x1E4F50280]);
        v12 = objc_msgSend(v10, "startDate", (void)v16);
        [v12 timeIntervalSinceReferenceDate];
        v13 = objc_msgSend(v11, "initWithEventBody:timestamp:", v10);

        [v4 addObject:v13];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F50230]) initWithSequence:v4];
  return v14;
}

- (id)eventsFromPublisher
{
  v3 = objc_opt_new();
  id v4 = [(ATXFakeModeEventProvider *)self biomePublisherWithBookmark:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__ATXFakeModeEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E68AD360;
  v10[4] = self;
  id v5 = v3;
  id v11 = v5;
  id v6 = (id)[v4 sinkWithCompletion:&__block_literal_global_63 receiveInput:v10];

  uint64_t v7 = v11;
  id v8 = v5;

  return v8;
}

void __47__ATXFakeModeEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = v7;
  if (isKindOfClass)
  {
    id v6 = [*(id *)(a1 + 32) aggregationEventsFromEvent:v7];
    if ([v6 count]) {
      [*(id *)(a1 + 40) addObjectsFromArray:v6];
    }

    id v5 = v7;
  }
}

- (BOOL)publisherIsCoreDuetWrapper
{
  return 0;
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      BOOL v13 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v8 = [v5 eventBody];
    uint64_t v9 = v8;
    BOOL wasInitializedWithoutEntity = self->_wasInitializedWithoutEntity;
    if (self->_wasInitializedWithoutEntity)
    {
      id v11 = [v8 entity];
      if (v11)
      {
        BOOL v12 = 1;
        goto LABEL_12;
      }
      if (self->_wasInitializedWithoutEntity)
      {
        id v11 = 0;
        BOOL v12 = 0;
        goto LABEL_12;
      }
    }
    v14 = [v9 entity];
    BOOL v12 = v14 == 0;

    if (!wasInitializedWithoutEntity)
    {
LABEL_13:
      BOOL v13 = !v12;

      goto LABEL_14;
    }
    id v11 = 0;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (id)aggregationEventsFromEvent:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ATXFakeModeEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = [v4 eventBody];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)updateEntitySpecificFeaturesDict:(id)a3 aggregationEvent:(id)a4 isLocalToMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v5)
  {
    v10 = [v8 entity];
    id v11 = [v7 objectForKeyedSubscript:v10];

    if (!v11)
    {
      BOOL v12 = objc_opt_new();
      BOOL v13 = [v9 entity];
      [v7 setObject:v12 forKeyedSubscript:v13];
    }
    v14 = [v9 entity];
    v15 = [v7 objectForKeyedSubscript:v14];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v16 = [v15 identifiersAndDates];
      id v17 = [NSString alloc];
      long long v18 = [v9 entity];
      long long v19 = [v18 identifier];
      long long v20 = NSNumber;
      uint64_t v21 = [v9 startDate];
      [v21 timeIntervalSince1970];
      uint64_t v22 = objc_msgSend(v20, "numberWithDouble:");
      v23 = (void *)[v17 initWithFormat:@"%@_%@", v19, v22];
      [v16 addObject:v23];
    }
    else
    {
      long long v16 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[ATXFakeModeEventProvider updateEntitySpecificFeaturesDict:aggregationEvent:isLocalToMode:]((uint64_t)v15, v16);
      }
    }
  }
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4 = a3;
  if ([(ATXFakeModeEventProvider *)self isEventFromProvider:v4])
  {
    BOOL v5 = [v4 eventBody];
    id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v7 = [v5 startDate];
    id v8 = [v5 endDate];
    uint64_t v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)@"FakeModeEvent";
}

- (void).cxx_destruct
{
}

- (void)updateEntitySpecificFeaturesDict:(uint64_t)a1 aggregationEvent:(NSObject *)a2 isLocalToMode:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Encountered an event of unknown type. Expected ATXFakeEntityFeatures, received: %@", (uint8_t *)&v5, 0xCu);
}

@end