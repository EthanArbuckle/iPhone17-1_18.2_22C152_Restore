@interface ATXInteractionEventProvider
- (ATXInteractionEventProvider)initWithContactStore:(id)a3;
- (BOOL)isEventFromProvider:(id)a3;
- (BOOL)publisherIsCoreDuetWrapper;
- (NSString)description;
- (id)aggregationEventsFromEvent:(id)a3;
- (id)biomePublisherWithBookmark:(id)a3;
- (id)contactEntityFromEvent:(id)a3;
- (id)contactEntityFromInstantMessagingInteraction:(id)a3;
- (id)dateIntervalFromEvent:(id)a3;
- (id)eventsFromPublisher;
@end

@implementation ATXInteractionEventProvider

- (ATXInteractionEventProvider)initWithContactStore:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXInteractionEventProvider;
  v5 = [(ATXInteractionEventProvider *)&v9 init];
  if (v5)
  {
    v6 = [[ATXStableContactRepresentationDatastore alloc] initWithContactStore:v4];
    stableContactRepresentationProvider = v5->_stableContactRepresentationProvider;
    v5->_stableContactRepresentationProvider = (ATXStableContactRepresentationProviderProtocol *)v6;
  }
  return v5;
}

- (id)biomePublisherWithBookmark:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v33 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
  v3 = objc_msgSend(MEMORY[0x1E4F5B400], "storeWithDirectory:readOnly:");
  id v4 = (void *)MEMORY[0x1E4F28F60];
  v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  uint64_t v6 = [v4 predicateWithFormat:@"(startDate >= %@)", v5];

  v7 = (void *)MEMORY[0x1E4F28F60];
  v8 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F27F2B50];
  uint64_t v9 = [v7 predicateWithFormat:@"(direction IN %@)", v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v30 = (void *)v9;
  v31 = (void *)v6;
  v42[0] = v6;
  v42[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  v12 = [v10 andPredicateWithSubpredicates:v11];

  v13 = [MEMORY[0x1E4F5B5D0] startDateSortDescriptorAscending:1];
  v41 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  id v39 = 0;
  v32 = v3;
  v15 = [v3 queryInteractionsUsingPredicate:v12 sortDescriptors:v14 limit:0 offset:0 error:&v39];
  id v29 = v39;

  v16 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v23 = (void *)MEMORY[0x1D25F6CC0]();
        if ([v22 direction] == 1)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F50280]);
          v25 = [v22 startDate];
          [v25 timeIntervalSinceReferenceDate];
          v26 = objc_msgSend(v24, "initWithEventBody:timestamp:", v22);

          [v16 addObject:v26];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v19);
  }

  v27 = (void *)[objc_alloc(MEMORY[0x1E4F50230]) initWithSequence:v16];
  return v27;
}

- (id)eventsFromPublisher
{
  v3 = objc_opt_new();
  id v4 = [(ATXInteractionEventProvider *)self biomePublisherWithBookmark:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__ATXInteractionEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E68AD360;
  v10[4] = self;
  id v5 = v3;
  id v11 = v5;
  id v6 = (id)[v4 sinkWithCompletion:&__block_literal_global_59 receiveInput:v10];

  v7 = v11;
  id v8 = v5;

  return v8;
}

void __50__ATXInteractionEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, void *a2)
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
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 eventBody];
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
  if ([(ATXInteractionEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = [v4 eventBody];
    id v6 = [ATXModeEvent alloc];
    id v7 = [v5 startDate];
    id v8 = [v5 endDate];
    uint64_t v9 = [(ATXInteractionEventProvider *)self contactEntityFromEvent:v4];
    v10 = [(ATXModeEvent *)v6 initWithStartDate:v7 endDate:v8 entity:v9];

    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v10, 0);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4 = a3;
  if ([(ATXInteractionEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = [v4 eventBody];
    id v6 = [v5 startDate];
    [v6 timeIntervalSinceReferenceDate];
    double v8 = v7;
    uint64_t v9 = [v5 endDate];
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;

    if (v8 <= v11)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28C18]);
      v14 = [v5 startDate];
      v15 = [v5 endDate];
      v12 = (void *)[v13 initWithStartDate:v14 endDate:v15];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)contactEntityFromEvent:(id)a3
{
  id v4 = a3;
  if ([(ATXInteractionEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = [v4 eventBody];
    if ([v5 mechanism] == 4)
    {
      id v6 = [(ATXInteractionEventProvider *)self contactEntityFromInstantMessagingInteraction:v5];
    }
    else
    {
      double v7 = [v5 recipients];
      unint64_t v8 = [v7 count];

      if (v8 <= 1)
      {
        uint64_t v9 = [v5 recipients];
        double v10 = [v9 firstObject];

        id v6 = [v10 personId];

        if (v6)
        {
          stableContactRepresentationProvider = self->_stableContactRepresentationProvider;
          v12 = [v10 personId];
          id v13 = [v10 identifier];
          v14 = [(ATXStableContactRepresentationProviderProtocol *)stableContactRepresentationProvider stableContactRepresentationForCnContactId:v12 rawIdentifier:v13];

          v15 = [v14 stableContactIdentifier];
          id v16 = objc_alloc(MEMORY[0x1E4F4AF60]);
          id v17 = [v10 displayName];
          uint64_t v18 = [v10 identifier];
          uint64_t v19 = [v10 personId];
          id v6 = (void *)[v16 initWithDisplayName:v17 rawIdentifier:v18 cnContactId:v19 stableContactIdentifier:v15];
        }
      }
      else
      {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)contactEntityFromInstantMessagingInteraction:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 recipients];
  if ((unint64_t)[v6 count] >= 2
    && ([v5 groupName],
        double v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v8))
  {
    uint64_t v9 = [v5 groupName];
    uint64_t v10 = 0;
  }
  else if ([v6 count] == 1)
  {
    double v11 = [v6 firstObject];
    uint64_t v9 = [v11 displayName];

    v12 = [v6 firstObject];
    uint64_t v10 = [v12 personId];
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
  }
  id v13 = [v5 bundleId];
  int v14 = [v13 isEqualToString:@"com.apple.MobileSMS"];

  if (v14)
  {
    uint64_t v15 = [v5 domainIdentifier];
  }
  else
  {
    uint64_t v16 = [v5 derivedIntentIdentifier];

    if (!v16) {
      goto LABEL_12;
    }
    uint64_t v15 = [v5 derivedIntentIdentifier];
  }
  uint64_t v16 = v15;
LABEL_12:
  if (v10 | v16)
  {
    if (!v10)
    {
      id v17 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = NSStringFromSelector(a2);
        uint64_t v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        int v28 = 138412546;
        id v29 = v18;
        __int16 v30 = 2112;
        v31 = v20;
        _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "No cnContactId provided for %@ in %@", (uint8_t *)&v28, 0x16u);
      }
    }
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F4AF60]) initWithDisplayName:v9 rawIdentifier:v16 cnContactId:v10];
    if ([v6 count] == 1)
    {
      stableContactRepresentationProvider = self->_stableContactRepresentationProvider;
      v23 = [v6 firstObject];
      id v24 = [v23 identifier];
      v25 = [(ATXStableContactRepresentationProviderProtocol *)stableContactRepresentationProvider stableContactRepresentationForCnContactId:v10 rawIdentifier:v24];

      v26 = [v25 stableContactIdentifier];
      [v21 setStableContactIdentifier:v26];
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (NSString)description
{
  return (NSString *)@"ContactInteractions";
}

- (void).cxx_destruct
{
}

@end