@interface EKSpotlightSearch
+ (id)_queryStringForPeopleMatchingSearchTerm:(id)a3;
+ (id)queryStringForSearchTerm:(id)a3 matchingTypes:(unint64_t)a4;
+ (id)queryStringForSearchTerm:(id)a3 matchingTypes:(unint64_t)a4 fromStartDate:(id)a5 toEndDate:(id)a6;
+ (id)searchWithCSQuery:(id)a3 inStore:(id)a4 inCalendars:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7;
- (EKEventStore)eventStore;
- (EKSpotlightSearch)initWithSearchWithCSQuery:(id)a3 inStore:(id)a4 inCalendars:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7;
- (id)query;
- (void)cancel;
- (void)setCachedNextOccurrenceDateOnRepeatingRemindersInEvents:(id)a3 withDateMap:(id)a4;
- (void)setEventStore:(id)a3;
- (void)start;
@end

@implementation EKSpotlightSearch

+ (id)searchWithCSQuery:(id)a3 inStore:(id)a4 inCalendars:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[EKSpotlightSearch alloc] initWithSearchWithCSQuery:v15 inStore:v14 inCalendars:v13 resultHandler:v12 completionHandler:v11];

  return v16;
}

- (EKSpotlightSearch)initWithSearchWithCSQuery:(id)a3 inStore:(id)a4 inCalendars:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)EKSpotlightSearch;
  v17 = [(EKSpotlightSearch *)&v33 init];
  if (v17)
  {
    objc_initWeak(&location, v17);
    objc_storeWeak((id *)&v17->_eventStore, v13);
    v18 = (objc_class *)EKWeakLinkClass();
    EKWeakLinkClass();
    v19 = objc_opt_new();
    v35[0] = *MEMORY[0x1E4F235A8];
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [v19 setFetchAttributes:v20];

    uint64_t v34 = *MEMORY[0x1E4F57920];
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [v19 setBundleIDs:v21];

    uint64_t v22 = [[v18 alloc] initWithQueryString:v12 context:v19];
    csQuery = v17->csQuery;
    v17->csQuery = (CSSearchQuery *)v22;

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke;
    v28[3] = &unk_1E5B99170;
    objc_copyWeak(&v31, &location);
    id v29 = v14;
    id v30 = v15;
    [(CSSearchQuery *)v17->csQuery setFoundItemsHandler:v28];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke_2;
    v25[3] = &unk_1E5B99198;
    id v26 = v16;
    objc_copyWeak(&v27, &location);
    [(CSSearchQuery *)v17->csQuery setCompletionHandler:v25];
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v9 = [v8 attributeSet];
        v10 = [v9 startDate];
        if (v10)
        {
          id v11 = [v8 uniqueIdentifier];
          id v12 = [v11 componentsSeparatedByString:@"."];
          id v13 = [v12 firstObject];

          id v14 = [v3 objectForKeyedSubscript:v13];

          if (!v14)
          {
            id v15 = [MEMORY[0x1E4F1CA48] array];
            [v3 setObject:v15 forKeyedSubscript:v13];
          }
          id v16 = [v3 objectForKeyedSubscript:v13];
          [v16 addObject:v10];
        }
        else
        {
          v17 = (void *)EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
            __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke_cold_1(v33, v17, v8, &v34);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v5);
  }

  v18 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v20 = [WeakRetained eventStore];
  v21 = [v20 eventsWithUUIDToOccurrenceDateMap:v3 inCalendars:*(void *)(a1 + 32)];

  if ([v21 count])
  {
    id v22 = objc_loadWeakRetained(v18);
    [v22 setCachedNextOccurrenceDateOnRepeatingRemindersInEvents:v21 withDateMap:v3];

    v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_63];
    v24 = [v21 filteredArrayUsingPredicate:v23];

    if ([v24 count])
    {
      uint64_t v25 = *(void *)(a1 + 40);
      id v26 = objc_loadWeakRetained(v18);
      (*(void (**)(uint64_t, id, void *))(v25 + 16))(v25, v26, v24);
    }
  }
  else
  {
    v24 = v21;
  }
}

BOOL __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isReminderIntegrationEvent]) {
    BOOL v3 = [v2 reminderOccurrenceType] != 1;
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

void __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, WeakRetained, v4);
}

- (void)setCachedNextOccurrenceDateOnRepeatingRemindersInEvents:(id)a3 withDateMap:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v19 = a4;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v11 hasRecurrenceRules]
          && [v11 isReminderIntegrationEvent])
        {
          id v12 = [v11 calendarItemIdentifier];
          id v13 = [v20 objectForKeyedSubscript:v12];
          if (!v13)
          {
            id v13 = [v19 objectForKeyedSubscript:v12];
            [v20 setObject:v13 forKeyedSubscript:v12];
            [v13 sortUsingSelector:sel_compare_];
          }
          unint64_t v14 = [v13 count];
          id v15 = [v11 startDate];
          uint64_t v16 = objc_msgSend(v13, "indexOfObject:inSortedRange:options:usingComparator:", v15, 0, v14, 0, &__block_literal_global_22_1);

          if (v16 != 0x7FFFFFFFFFFFFFFFLL && v16 + 1 < v14)
          {
            v18 = objc_msgSend(v13, "objectAtIndexedSubscript:");
            [v11 _setNextCachedReminderOccurrenceDate:v18];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

uint64_t __89__EKSpotlightSearch_setCachedNextOccurrenceDateOnRepeatingRemindersInEvents_withDateMap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)query
{
  return (id)[(CSSearchQuery *)self->csQuery queryString];
}

+ (id)_queryStringForPeopleMatchingSearchTerm:(id)a3
{
  return (id)[NSString stringWithFormat:@"primaryRecipients == \"%@*\"cdwt || authors == \"%@*\"cdwt || recipientNames == \"%@*\"cdwt || recipientEmailAddresses == \"%@*\"cdwt || authorNames == \"%@*\"cdwt || authorEmailAddresses ==  \"%@*\"cdwt || ", a3, a3, a3, a3, a3, a3];
}

+ (id)queryStringForSearchTerm:(id)a3 matchingTypes:(unint64_t)a4
{
  return +[EKSpotlightSearch queryStringForSearchTerm:a3 matchingTypes:a4 fromStartDate:0 toEndDate:0];
}

+ (id)queryStringForSearchTerm:(id)a3 matchingTypes:(unint64_t)a4 fromStartDate:(id)a5 toEndDate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E4F28E78];
  unint64_t v14 = [(id)*MEMORY[0x1E4F44358] identifier];
  id v15 = objc_msgSend(v13, "stringWithFormat:", @"contentType == \"%@\" && ("), v14;

  if (!a4)
  {
    [v15 appendFormat:@"title == \"%@*\"cdwt || comment == \"%@*\"cdwt || namedLocation == \"%@*\"cdwt || ", v10, v10, v10];
    uint64_t v16 = [a1 _queryStringForPeopleMatchingSearchTerm:v10];
    [v15 appendString:v16];

    goto LABEL_12;
  }
  if ((a4 & 1) == 0)
  {
    if ((a4 & 2) == 0) {
      goto LABEL_4;
    }
LABEL_9:
    [v15 appendFormat:@"namedLocation == \"%@*\"cdwt || ", v10];
    if ((a4 & 4) == 0)
    {
LABEL_5:
      if ((a4 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [v15 appendFormat:@"title == \"%@*\"cdwt || ", v10];
  if ((a4 & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((a4 & 4) == 0) {
    goto LABEL_5;
  }
LABEL_10:
  v17 = [a1 _queryStringForPeopleMatchingSearchTerm:v10];
  [v15 appendString:v17];

  if ((a4 & 8) != 0) {
LABEL_11:
  }
    [v15 appendFormat:@"comment == \"%@*\"cdwt || ", v10];
LABEL_12:
  uint64_t v18 = [@" || " length];
  [v15 replaceCharactersInRange:objc_msgSend(v15, "length") - v18, v18, @"" withString]);
  if (v11 && v12)
  {
    [v11 timeIntervalSinceReferenceDate];
    uint64_t v20 = v19;
    [v12 timeIntervalSinceReferenceDate];
    objc_msgSend(v15, "appendFormat:", @"&& startDate <= $time.absolute(%f) && endDate >= $time.absolute(%f)", v21, v20);
  }
  else if (v11)
  {
    [v11 timeIntervalSinceReferenceDate];
    objc_msgSend(v15, "appendFormat:", @"&& endDate > $time.absolute(%f)", v22, v25);
  }
  else if (v12)
  {
    [v12 timeIntervalSinceReferenceDate];
    objc_msgSend(v15, "appendFormat:", @"&& startDate < $time.absolute(%f)", v23, v25);
  }

  return v15;
}

- (void)start
{
}

- (void)cancel
{
}

- (EKEventStore)eventStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);

  return (EKEventStore *)WeakRetained;
}

- (void)setEventStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventStore);

  objc_storeStrong((id *)&self->csQuery, 0);
}

void __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 uniqueIdentifier];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_ERROR, "Fetched search item had nil start date, skipping showing search result: %@", a1, 0xCu);
}

@end