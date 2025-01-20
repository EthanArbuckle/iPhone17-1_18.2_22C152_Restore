@interface SGEKCalendarAdapter
- (BOOL)_cancelEKEvent:(id)a3 ekStore:(id)a4 error:(id *)a5;
- (BOOL)_isEKEventFromNLEventsCalendar:(id)a3 ekStore:(id)a4;
- (BOOL)_isEKEventFromSuggestedCalendar:(id)a3 ekStore:(id)a4;
- (BOOL)_updateEKEvent:(id)a3 withEvent:(id)a4 ekStore:(id)a5 error:(id *)a6;
- (SGEKCalendarAdapter)initWithSGSqlEntityStore:(id)a3;
- (SGEKCalendarAdapter)initWithSGSqlEntityStore:(id)a3 andEKStore:(id)a4;
- (SGSqlEntityStore)store;
- (id)_eventsAssociatedWithStorageEvent:(id)a3 store:(id)a4;
- (void)_addEKEventToCalendar:(id)a3 storageEvent:(id)a4 ekStore:(id)a5 commit:(BOOL)a6;
- (void)_removeEKEvent:(id)a3 store:(id)a4 commit:(BOOL)a5;
- (void)_removeEvent:(id)a3 commit:(BOOL)a4;
- (void)_runWithEKEventStore:(id)a3;
- (void)_updateEvent:(id)a3 withValuesFrom:(id)a4 ekStore:(id)a5;
- (void)_updateEventMetadataInModifiedEvent:(id)a3 withExistingCheckInShortcutInOriginalEvent:(id)a4 ifTeamIdentifierIsDifferentInStorageEvent:(id)a5;
- (void)addEvent:(id)a3;
- (void)addEvent:(id)a3 commit:(BOOL)a4;
- (void)addEvents:(id)a3;
- (void)cancelEvent:(id)a3;
- (void)cancelEvent:(id)a3 commit:(BOOL)a4;
- (void)cancelEvents:(id)a3;
- (void)confirmEventFromOtherDevice:(id)a3;
- (void)confirmEventFromThisDevice:(id)a3;
- (void)orphanEvent:(id)a3;
- (void)rejectEventFromOtherDevice:(id)a3;
- (void)rejectEventFromThisDevice:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation SGEKCalendarAdapter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_lazyEKStoreLock, 0);
}

- (void)setStore:(id)a3
{
}

- (SGSqlEntityStore)store
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  return (SGSqlEntityStore *)WeakRetained;
}

- (void)_removeEKEvent:(id)a3 store:(id)a4 commit:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v13 = 0;
  char v8 = [a4 removeEvent:v7 span:0 commit:v5 error:&v13];
  id v9 = v13;
  v10 = sgEventsLogHandle();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter _removeEKEvent: Successfully removed event.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter _removeEKEvent: Unable to remove event. EKStore commit error: %@", buf, 0xCu);
    }

    v11 = sgEventsLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v7 description];
      *(_DWORD *)buf = 138740227;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "SGEKCalendar _removeEKEvent: AdapterUnable to remove event; description: %{sensitive}@, error: %@",
        buf,
        0x16u);
    }
  }
}

- (void)_updateEventMetadataInModifiedEvent:(id)a3 withExistingCheckInShortcutInOriginalEvent:(id)a4 ifTeamIdentifierIsDifferentInStorageEvent:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F5DA18] eventMetadataFromEKEvent:v7];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v11 = [v10 eventActivities];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v56;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v56 != v14) {
          objc_enumerationMutation(v11);
        }
        if ([*(id *)(*((void *)&v55 + 1) + 8 * i) type] == 1)
        {
          char v16 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  char v16 = 0;
LABEL_11:

  id v17 = [MEMORY[0x1E4F5DA18] eventMetadataFromEKEvent:v8];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v18 = [v17 eventActivities];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (!v19)
  {
    id v24 = 0;
    goto LABEL_37;
  }
  uint64_t v20 = v19;
  id v48 = v8;
  v49 = v9;
  uint64_t v21 = *(void *)v52;
  while (2)
  {
    for (uint64_t j = 0; j != v20; ++j)
    {
      if (*(void *)v52 != v21) {
        objc_enumerationMutation(v18);
      }
      v23 = *(void **)(*((void *)&v51 + 1) + 8 * j);
      if ([v23 type] == 1)
      {
        id v24 = v23;

        if (v24) {
          char v25 = v16;
        }
        else {
          char v25 = 1;
        }
        if (v25)
        {
          id v8 = v48;
          id v9 = v49;
          goto LABEL_38;
        }
        v26 = [v49 duplicateKey];
        v27 = [v26 parentKey];
        v28 = [v27 bundleId];

        if (v28)
        {
          id v50 = 0;
          v29 = [MEMORY[0x1E4F223C8] bundleRecordWithBundleIdentifier:v28 allowPlaceholder:0 error:&v50];
          id v18 = v50;
          if (v29)
          {
LABEL_33:
            v47 = v7;
            v31 = [v29 teamIdentifier];
            v32 = [v24 teamIdentifier];
            char v33 = [v31 isEqualToString:v32];

            if ((v33 & 1) == 0)
            {
              id v44 = objc_alloc(MEMORY[0x1E4F5DA18]);
              unsigned int v43 = [v10 type];
              v42 = [v10 categoryDescription];
              [v10 originBundleId];
              v34 = v45 = v31;
              [v10 confidence];
              double v36 = v35;
              v37 = [v10 schemaOrg];
              [v10 participants];
              v38 = v46 = v28;
              v39 = [v17 eventActivities];
              v40 = (void *)[v44 initWithType:v43 categoryDescription:v42 originBundleId:v34 confidence:v37 schemaOrg:v38 participants:v39 eventActivities:v36];

              v28 = v46;
              v31 = v45;

              v41 = [v40 jsonObject];
              [v47 setCustomObject:v41 forKey:*MEMORY[0x1E4F5DEC0]];
            }
            id v7 = v47;
            goto LABEL_36;
          }
        }
        else
        {
          id v18 = 0;
        }
        v30 = sgLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v60 = v18;
          _os_log_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEFAULT, "SGEkCalendarAdapter: no bundle record found: %@", buf, 0xCu);
        }

        v29 = 0;
        goto LABEL_33;
      }
    }
    uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v20) {
      continue;
    }
    break;
  }
  id v24 = 0;
LABEL_36:
  id v8 = v48;
  id v9 = v49;
LABEL_37:

LABEL_38:
}

- (void)_removeEvent:(id)a3 commit:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__SGEKCalendarAdapter__removeEvent_commit___block_invoke;
  v8[3] = &unk_1E65C04B8;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(SGEKCalendarAdapter *)self _runWithEKEventStore:v8];
}

void __43__SGEKCalendarAdapter__removeEvent_commit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) _eventsAssociatedWithStorageEvent:*(void *)(a1 + 40) store:v3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        BOOL v10 = [v9 calendar];
        if ([v10 isSuggestedEventCalendar])
        {
        }
        else
        {
          v11 = [v9 calendar];
          int v12 = [v11 isNaturalLanguageSuggestedEventCalendar];

          if (!v12) {
            continue;
          }
        }
        [*(id *)(a1 + 32) _removeEKEvent:v9 store:v3 commit:*(unsigned __int8 *)(a1 + 48)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (BOOL)_isEKEventFromNLEventsCalendar:(id)a3 ekStore:(id)a4
{
  v4 = [a3 calendar];
  char v5 = [v4 isNaturalLanguageSuggestedEventCalendar];

  return v5;
}

- (BOOL)_isEKEventFromSuggestedCalendar:(id)a3 ekStore:(id)a4
{
  v4 = [a3 calendar];
  char v5 = [v4 isSuggestedEventCalendar];

  return v5;
}

- (BOOL)_cancelEKEvent:(id)a3 ekStore:(id)a4 error:(id *)a5
{
  id v5 = a3;
  uint64_t v6 = sgEventsLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v9 = 0;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter: Calling _cancelEKEvent", v9, 2u);
  }

  char v7 = [v5 updateEventToEvent:0];
  return v7;
}

- (BOOL)_updateEKEvent:(id)a3 withEvent:(id)a4 ekStore:(id)a5 error:(id *)a6
{
  id v7 = a4;
  id v8 = a3;
  id v9 = sgEventsLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v12 = 0;
    _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter: Calling _updateEKEvent", v12, 2u);
  }

  char v10 = [v8 updateEventToEvent:v7];
  return v10;
}

- (void)_addEKEventToCalendar:(id)a3 storageEvent:(id)a4 ekStore:(id)a5 commit:(BOOL)a6
{
  BOOL v52 = a6;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sgEventsLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v8 loggingIdentifier];
    *(_DWORD *)buf = 138543362;
    id v61 = v12;
    _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter _addEKEventToCalendar: Adding event via EK. [SGEvent (%{public}@)]", buf, 0xCu);
  }
  long long v13 = [v8 toEKEventWithStore:v10];
  int v14 = [v8 isNaturalLanguageEvent];
  long long v15 = sgEventsLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  long long v51 = v10;
  if (v14)
  {
    if (v16)
    {
      v42 = [v8 loggingIdentifier];
      *(_DWORD *)buf = 138543362;
      id v61 = v42;
      _os_log_debug_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter _addEKEventToCalendar: Adding event to naturalLanguageSuggestedEventCalendar. [SGEvent (%{public}@)]", buf, 0xCu);
    }
    uint64_t v17 = [v10 naturalLanguageSuggestedEventCalendar];
  }
  else
  {
    if (v16)
    {
      unsigned int v43 = [v8 loggingIdentifier];
      *(_DWORD *)buf = 138543362;
      id v61 = v43;
      _os_log_debug_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter _addEKEventToCalendar: Adding event to suggestedEventCalendar. [SGEvent (%{public}@)]", buf, 0xCu);
    }
    uint64_t v17 = [v10 suggestedEventCalendar];
  }
  uint64_t v18 = (void *)v17;
  objc_msgSend(v13, "setCalendar:", v17, self);

  uint64_t v19 = +[SGStructuredEventTrialClientWrapper sharedInstance];
  uint64_t v20 = [v19 notificationsAllowListOverride];
  long long v53 = v8;
  uint64_t v21 = [v8 shouldAllowNotificationsInCalendarWithAllowListOverride:v20];

  v22 = [NSNumber numberWithBool:v21];
  [v13 setLocalCustomObject:v22 forKey:*MEMORY[0x1E4F5DF50]];

  id v23 = objc_alloc(MEMORY[0x1E4F25640]);
  id v24 = v9;
  id v50 = [v9 opaqueKey];
  char v25 = [v9 duplicateKey];
  [v25 serialize];
  v27 = v26 = v13;
  v28 = [v9 duplicateKey];
  v29 = [v28 parentKey];
  v30 = [v29 messageKey];
  v31 = [v30 uniqueIdentifier];
  v32 = (void *)[v23 initWithEventStore:v51 opaqueKey:v50 uniqueKey:v27 extractionGroupIdentifier:v31];
  [v26 setSuggestionInfo:v32];

  [v24 creationTimestamp];
  double v34 = v33;
  uint64_t v35 = [v26 suggestionInfo];
  [(id)v35 setTimestamp:v34];

  id v59 = 0;
  LOBYTE(v35) = [v51 saveEvent:v26 span:0 commit:v52 error:&v59];
  id v36 = v59;
  v37 = sgEventsLogHandle();
  v38 = v37;
  if (v35)
  {
    v39 = v53;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      id v44 = [v53 loggingIdentifier];
      v45 = [v26 eventIdentifier];
      *(_DWORD *)buf = 138543618;
      id v61 = v44;
      __int16 v62 = 2114;
      id v63 = v45;
      _os_log_debug_impl(&dword_1CA650000, v38, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter _addEKEventToCalendar: Successfully saved event in event store. [SGEvent (%{public}@)], [EKEvent (%{public}@)]", buf, 0x16u);
    }
    if (_addEKEventToCalendar_storageEvent_ekStore_commit___pasOnceToken37 != -1) {
      dispatch_once(&_addEKEventToCalendar_storageEvent_ekStore_commit___pasOnceToken37, &__block_literal_global_42_42263);
    }
    v40 = (void *)_addEKEventToCalendar_storageEvent_ekStore_commit___pasExprOnceResult;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__SGEKCalendarAdapter__addEKEventToCalendar_storageEvent_ekStore_commit___block_invoke_2;
    block[3] = &unk_1E65C0638;
    id v55 = v53;
    id v56 = v26;
    uint64_t v57 = v49;
    id v58 = v24;
    v41 = v40;
    dispatch_async(v41, block);
  }
  else
  {
    v39 = v53;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v46 = [v53 loggingIdentifier];
      *(_DWORD *)buf = 138412546;
      id v61 = v36;
      __int16 v62 = 2114;
      id v63 = v46;
      _os_log_error_impl(&dword_1CA650000, v38, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter _addEKEventToCalendar: Unable to save event in event store: %@. [SGEvent (%{public}@)]", buf, 0x16u);
    }
    v41 = sgEventsLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v47 = [v26 description];
      *(_DWORD *)buf = 138740227;
      id v61 = v47;
      __int16 v62 = 2112;
      id v63 = v36;
      _os_log_debug_impl(&dword_1CA650000, v41, OS_LOG_TYPE_DEBUG, "Unable to save event in event store; description: %{sensitive}@, error: %@",
        buf,
        0x16u);
    }
  }
}

void __73__SGEKCalendarAdapter__addEKEventToCalendar_storageEvent_ekStore_commit___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isNaturalLanguageEvent])
  {
    v2 = (void *)MEMORY[0x1E4F5DAB8];
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 recordInteractionForEventWithInterface:0 actionType:1 harvestedEKEvent:v3 curatedEKEvent:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 16));
    id v5 = [*(id *)(a1 + 56) recordId];
    id v7 = [WeakRetained loadEntityByRecordId:v5];

    uint64_t v6 = +[SGRTCLogging defaultLogger];
    [v6 logEventInteractionForEntity:v7 interface:0 actionType:1];
  }
}

void __73__SGEKCalendarAdapter__addEKEventToCalendar_storageEvent_ekStore_commit___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"_addEKEventToCalendar" qosClass:9];
  v2 = (void *)_addEKEventToCalendar_storageEvent_ekStore_commit___pasExprOnceResult;
  _addEKEventToCalendar_storageEvent_ekStore_commit___pasExprOnceResult = v1;
}

- (id)_eventsAssociatedWithStorageEvent:(id)a3 store:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 heuristicUpdatingEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
    if (WeakRetained)
    {
      id v10 = [v8 eventsWithSameOpaqueKeyAsStorageEvent:v7 harvestStore:WeakRetained];
      if (![v10 count])
      {
        v11 = [v8 eventsWithSameAlternativeOpaqueKeyAsStorageEvent:v7 harvestStore:WeakRetained];
        if ([v11 count])
        {
          uint64_t v29 = MEMORY[0x1E4F143A8];
          uint64_t v30 = 3221225472;
          v31 = __63__SGEKCalendarAdapter__eventsAssociatedWithStorageEvent_store___block_invoke;
          v32 = &unk_1E65C04E0;
          double v34 = self;
          SEL v35 = a2;
          id v33 = v7;
          uint64_t v12 = sgMapAndFilter();

          id v10 = (void *)v12;
        }
      }
      if (![v10 count])
      {
        long long v13 = [v7 recordId];
        int v14 = [WeakRetained loadEntityByRecordId:v13];

        if (v14)
        {
          long long v15 = objc_opt_new();
          uint64_t v24 = MEMORY[0x1E4F143A8];
          uint64_t v25 = 3221225472;
          v26 = __63__SGEKCalendarAdapter__eventsAssociatedWithStorageEvent_store___block_invoke_2;
          v27 = &unk_1E65C0508;
          id v16 = v15;
          id v28 = v16;
          +[SGDeduper enumerateEKEventsForPseudoEventBySimilarStartAndEndTime:v14 store:v8 usingBlock:&v24];
          id v17 = v16;

          if (objc_msgSend(v17, "count", v24, v25, v26, v27))
          {
            uint64_t v18 = sgEventsLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              id v23 = [v7 loggingIdentifier];
              *(_DWORD *)buf = 138543362;
              uint64_t v37 = (uint64_t)v23;
              _os_log_debug_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdatper _eventsAssociatedWithStorageEvent: Located associated event based on content rather than pseudoevent key match. [SGStorageEvent (%{public}@)]", buf, 0xCu);
            }
          }

          id v10 = v17;
        }
      }
      if ((unint64_t)[v10 count] >= 2)
      {
        uint64_t v19 = sgEventsLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = [v10 count];
          v22 = [v7 loggingIdentifier];
          *(_DWORD *)buf = 134218242;
          uint64_t v37 = v21;
          __int16 v38 = 2114;
          v39 = v22;
          _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdatper _eventsAssociatedWithStorageEvent: More than one matching event found (%lu). [SGStorageEvent (%{public}@)]", buf, 0x16u);
        }
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

id __63__SGEKCalendarAdapter__eventsAssociatedWithStorageEvent_store___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) duplicateKey];
  id v5 = [v4 pseudoEventKey];
  int v6 = [v5 isDropoff];

  if (v6)
  {
    id v7 = [v3 suggestionInfo];
    id v8 = [v7 opaqueKey];

    if (!v8)
    {
      long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"SGEKCalendarAdapter.m", 406, @"Invalid parameter not satisfying: %@", @"foundEvent.suggestionInfo.opaqueKey" object file lineNumber description];
    }
    id v9 = [SGPseudoEventKey alloc];
    id v10 = [v3 suggestionInfo];
    v11 = [v10 opaqueKey];
    uint64_t v12 = [(SGPseudoEventKey *)v9 initWithSerialized:v11];

    if ([(SGPseudoEventKey *)v12 isDropoff]) {
      id v13 = v3;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = v3;
  }

  return v13;
}

void __63__SGEKCalendarAdapter__eventsAssociatedWithStorageEvent_store___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 suggestionInfo];

  if (v3) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)orphanEvent:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__SGEKCalendarAdapter_orphanEvent___block_invoke;
  v6[3] = &unk_1E65C0490;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SGEKCalendarAdapter *)self _runWithEKEventStore:v6];
}

void __35__SGEKCalendarAdapter_orphanEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _eventsAssociatedWithStorageEvent:*(void *)(a1 + 40) store:v3];
  if ([v4 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v20 = v3;
      obuint64_t j = v5;
      uint64_t v19 = v4;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v11 = [v10 suggestionInfo];
          uint64_t v12 = [v11 uniqueKey];
          id v13 = [*(id *)(a1 + 40) duplicateKey];
          int v14 = [v13 serialize];
          int v15 = [v12 isEqualToString:v14];

          if (v15)
          {
            if (([*(id *)(a1 + 32) _isEKEventFromSuggestedCalendar:v10 ekStore:v20] & 1) != 0
              || [*(id *)(a1 + 32) _isEKEventFromNLEventsCalendar:v10 ekStore:v20])
            {
              [*(id *)(a1 + 32) _removeEKEvent:v10 store:v20 commit:1];
            }
            else
            {
              id v16 = sgEventsLogHandle();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                id v17 = [*(id *)(a1 + 40) loggingIdentifier];
                *(_DWORD *)buf = 138543362;
                id v28 = v17;
                _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter orphanEvent: Orphaned event is on a curated calendar; not removing. [SGStorageEvent (%{public}@)]",
                  buf,
                  0xCu);
              }
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
      id v3 = v20;
      id v5 = obj;
      id v4 = v19;
    }
  }
  else
  {
    id v5 = sgEventsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [*(id *)(a1 + 40) loggingIdentifier];
      *(_DWORD *)buf = 138543362;
      id v28 = v18;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter orphanEvent: No existing event found. [SGStorageEvent (%{public}@)]", buf, 0xCu);
    }
  }
}

- (void)rejectEventFromOtherDevice:(id)a3
{
}

- (void)rejectEventFromThisDevice:(id)a3
{
}

- (void)confirmEventFromOtherDevice:(id)a3
{
}

- (void)confirmEventFromThisDevice:(id)a3
{
}

- (void)cancelEvents:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__SGEKCalendarAdapter_cancelEvents___block_invoke;
  v6[3] = &unk_1E65C0490;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(SGEKCalendarAdapter *)self _runWithEKEventStore:v6];
}

void __36__SGEKCalendarAdapter_cancelEvents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 40) cancelEvent:*(void *)(*((void *)&v19 + 1) + 8 * v8++) commit:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v6);
  }

  id v18 = 0;
  char v9 = [v3 commit:&v18];
  id v10 = v18;
  v11 = sgEventsLogHandle();
  uint64_t v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [*(id *)(a1 + 32) valueForKey:@"loggingIdentifier"];
      int v14 = objc_msgSend(v13, "_pas_componentsJoinedByString:", @",");
      *(_DWORD *)buf = 138543362;
      id v24 = v14;
      _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter cancelEvents: Successfully removed events. [SGStorageEvent (%{public}@)]", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = [*(id *)(a1 + 32) valueForKey:@"loggingIdentifier"];
      id v16 = objc_msgSend(v15, "_pas_componentsJoinedByString:", @",");
      *(_DWORD *)buf = 138412546;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v16;
      _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter cancelEvents: Unable to remove events. EKStore commit error: %@. [SGStorageEvent (%{public}@)]", buf, 0x16u);
    }
    uint64_t v12 = sgEventsLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [*(id *)(a1 + 32) description];
      *(_DWORD *)buf = 138740227;
      id v24 = v17;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "Unable to remove events; description: %{sensitive}@, error: %@",
        buf,
        0x16u);
    }
  }
}

- (void)cancelEvent:(id)a3
{
}

- (void)cancelEvent:(id)a3 commit:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__SGEKCalendarAdapter_cancelEvent_commit___block_invoke;
  v8[3] = &unk_1E65C04B8;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(SGEKCalendarAdapter *)self _runWithEKEventStore:v8];
}

void __42__SGEKCalendarAdapter_cancelEvent_commit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _eventsAssociatedWithStorageEvent:*(void *)(a1 + 40) store:v3];
  if ([v4 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v28 = v4;
      uint64_t v8 = *(void *)v32;
      uint64_t v29 = *MEMORY[0x1E4F5DF50];
      while (1)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
          if (([*(id *)(a1 + 32) _isEKEventFromSuggestedCalendar:v10 ekStore:v3] & 1) != 0
            || [*(id *)(a1 + 32) _isEKEventFromNLEventsCalendar:v10 ekStore:v3])
          {
            [*(id *)(a1 + 32) _removeEKEvent:v10 store:v3 commit:*(unsigned __int8 *)(a1 + 48)];
            goto LABEL_10;
          }
          v11 = [*(id *)(a1 + 40) tags];
          uint64_t v12 = [MEMORY[0x1E4F5D9F0] naturalLanguageEvent];
          int v13 = [v11 containsObject:v12];

          if (!v13)
          {
            [v10 setLocalCustomObject:MEMORY[0x1E4F1CC28] forKey:v29];
            int v15 = *(void **)(a1 + 32);
            id v30 = 0;
            int v16 = [v15 _cancelEKEvent:v10 ekStore:v3 error:&v30];
            id v17 = v30;
            id v18 = sgEventsLogHandle();
            long long v19 = v18;
            if (v16)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                long long v20 = [*(id *)(a1 + 40) loggingIdentifier];
                *(_DWORD *)buf = 138543362;
                id v36 = v20;
                long long v21 = v19;
                long long v22 = "SGEKCalendarAdapter _updateEvent: Successfully Removed event in a curated calendar. [SGStorageEvent (%{public}@)]";
                uint32_t v23 = 12;
                goto LABEL_24;
              }
            }
            else
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                __int16 v25 = [*(id *)(a1 + 40) loggingIdentifier];
                *(_DWORD *)buf = 138412546;
                id v36 = v17;
                __int16 v37 = 2114;
                id v38 = v25;
                _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter _updateEvent: Unable to save event cancellation: %@. [SGStorageEvent (%{public}@)]", buf, 0x16u);
              }
              long long v19 = sgEventsLogHandle();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                long long v20 = [v10 description];
                *(_DWORD *)buf = 138740227;
                id v36 = v20;
                __int16 v37 = 2112;
                id v38 = v17;
                long long v21 = v19;
                long long v22 = "SGEKCalendarAdapter _updateEvent: Unable to save event cancellation; description: %{sensitive}@, error: %@";
                uint32_t v23 = 22;
LABEL_24:
                _os_log_debug_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEBUG, v22, buf, v23);
              }
            }

            goto LABEL_10;
          }
          int v14 = sgEventsLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            id v24 = [*(id *)(a1 + 40) loggingIdentifier];
            *(_DWORD *)buf = 138543362;
            id v36 = v24;
            _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter cancelEvent: NL Event cancelled. [SGStorageEvent (%{public}@)]", buf, 0xCu);
          }
LABEL_10:
          ++v9;
        }
        while (v7 != v9);
        uint64_t v26 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
        uint64_t v7 = v26;
        if (!v26)
        {
          id v4 = v28;
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v5 = sgEventsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v27 = [*(id *)(a1 + 40) loggingIdentifier];
      *(_DWORD *)buf = 138543362;
      id v36 = v27;
      _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter cancelEvent: No existing event found. [SGStorageEvent (%{public}@)]", buf, 0xCu);
    }
  }
}

- (void)_updateEvent:(id)a3 withValuesFrom:(id)a4 ekStore:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  if (WeakRetained)
  {
    uint64_t v12 = [v8 eventIdentifier];
    int v13 = [v10 eventWithIdentifier:v12];

    if (!v13)
    {
      int v14 = sgEventsLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v38 = [v8 eventIdentifier];
        v39 = [v9 loggingIdentifier];
        *(_DWORD *)buf = 138412546;
        id v44 = v38;
        __int16 v45 = 2114;
        id v46 = v39;
        _os_log_error_impl(&dword_1CA650000, v14, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter _updateEvent: Calendar Event missing from store for identifier: %@. [SGStorageEvent (%{public}@)]", buf, 0x16u);
      }
      goto LABEL_16;
    }
    int v14 = [v9 convertToEvent:WeakRetained];
    v41 = [WeakRetained confirmedFieldValuesForEvent:v9];
    -[NSObject mergeIntoEKEvent:withStore:preservingValuesDifferentFrom:](v14, "mergeIntoEKEvent:withStore:preservingValuesDifferentFrom:", v13, v10);
    [(SGEKCalendarAdapter *)self _updateEventMetadataInModifiedEvent:v13 withExistingCheckInShortcutInOriginalEvent:v8 ifTeamIdentifierIsDifferentInStorageEvent:v9];
    [v13 setLocalCustomObject:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F5DF50]];
    int v15 = [v13 structuredLocation];
    [v15 radius];
    double v17 = v16;
    id v18 = [v8 structuredLocation];
    [v18 radius];
    double v20 = v19;

    if (v17 != v20)
    {
      long long v21 = [v13 structuredLocation];
      long long v22 = (void *)[v21 copy];

      uint32_t v23 = [v8 structuredLocation];
      [v23 radius];
      objc_msgSend(v22, "setRadius:");

      id v24 = [v8 structuredLocation];
      int v25 = [v22 isEqualToLocation:v24];

      if (v25)
      {
        uint64_t v26 = [v8 structuredLocation];
        [v26 radius];
        double v28 = v27;
        uint64_t v29 = [v13 structuredLocation];
        [v29 setRadius:v28];
      }
    }
    id v42 = 0;
    BOOL v30 = [(SGEKCalendarAdapter *)self _updateEKEvent:v8 withEvent:v13 ekStore:v10 error:&v42];
    id v31 = v42;
    long long v32 = sgEventsLogHandle();
    long long v33 = v32;
    if (v30)
    {
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      long long v34 = [v9 loggingIdentifier];
      *(_DWORD *)buf = 138543362;
      id v44 = v34;
      SEL v35 = "SGEKCalendarAdapter _updateEvent: Successfully updated event. [SGStorageEvent (%{public}@)]";
      id v36 = v33;
      uint32_t v37 = 12;
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = [v9 loggingIdentifier];
        *(_DWORD *)buf = 138412546;
        id v44 = v31;
        __int16 v45 = 2114;
        id v46 = v40;
        _os_log_error_impl(&dword_1CA650000, v33, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter _updateEvent: Unable to update event: %@. [SGStorageEvent (%{public}@)]", buf, 0x16u);
      }
      long long v33 = sgEventsLogHandle();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_15;
      }
      long long v34 = [v13 description];
      *(_DWORD *)buf = 138740227;
      id v44 = v34;
      __int16 v45 = 2112;
      id v46 = v31;
      SEL v35 = "SGEKCalendarAdapter _updateEKEvent: Unable to update event; description: %{sensitive}@, error: %@";
      id v36 = v33;
      uint32_t v37 = 22;
    }
    _os_log_debug_impl(&dword_1CA650000, v36, OS_LOG_TYPE_DEBUG, v35, buf, v37);

    goto LABEL_15;
  }
LABEL_17:
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__SGEKCalendarAdapter_addEvents___block_invoke;
  v6[3] = &unk_1E65C0490;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(SGEKCalendarAdapter *)self _runWithEKEventStore:v6];
}

void __33__SGEKCalendarAdapter_addEvents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 40) addEvent:*(void *)(*((void *)&v15 + 1) + 8 * v8++) commit:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v6);
  }

  id v14 = 0;
  char v9 = [v3 commit:&v14];
  id v10 = v14;
  v11 = sgEventsLogHandle();
  uint64_t v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter addEvents: Successfully saved events in event store", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter addEvents: Unable to save events in event store. EKStore commit error: %@", buf, 0xCu);
    }

    uint64_t v12 = sgEventsLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = [*(id *)(a1 + 32) description];
      *(_DWORD *)buf = 138740227;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter addEvents: Unable to save events in event store; description: %{sensitive}@, error: %@",
        buf,
        0x16u);
    }
  }
}

- (void)addEvent:(id)a3
{
}

- (void)addEvent:(id)a3 commit:(BOOL)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained eventIsCancelled:v6])
    {
      char v9 = sgEventsLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v6 loggingIdentifier];
        *(_DWORD *)buf = 138543362;
        id v48 = v10;
        v11 = "SGEKCalendarAdapter addEvent: Skipping event already known to be cancelled. [SGStorageEvent (%{public}@)]";
LABEL_11:
        _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
LABEL_12:

        goto LABEL_33;
      }
      goto LABEL_33;
    }
    BOOL v37 = a4;
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSince1970];
    double v14 = v13;

    int v15 = [MEMORY[0x1E4F5DAF0] showPastEvents];
    long long v16 = [v6 when];
    if (v16)
    {
      long long v17 = v16;
      if (v15)
      {

LABEL_13:
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v22 = [v6 tags];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (!v23)
        {

          char v9 = 0;
LABEL_32:
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __39__SGEKCalendarAdapter_addEvent_commit___block_invoke;
          v38[3] = &unk_1E65C0468;
          v38[4] = self;
          id v39 = v6;
          id v40 = v8;
          BOOL v41 = v37;
          [(SGEKCalendarAdapter *)self _runWithEKEventStore:v38];

          goto LABEL_33;
        }
        uint64_t v24 = v23;
        id v36 = self;
        char v9 = 0;
        uint64_t v25 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v43 != v25) {
              objc_enumerationMutation(v22);
            }
            double v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if ([v27 isEventCompletenessTag])
            {
              double v28 = v27;

              char v9 = v28;
            }
            else if ((v15 & 1) == 0)
            {
              uint64_t v29 = [MEMORY[0x1E4F5D9F0] eventExtractedFromOldDocument];
              int v30 = [v27 isEqualToEntityTag:v29];

              if (v30)
              {
                long long v34 = sgEventsLogHandle();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  SEL v35 = [v6 loggingIdentifier];
                  *(_DWORD *)buf = 138543362;
                  id v48 = v35;
                  _os_log_impl(&dword_1CA650000, v34, OS_LOG_TYPE_DEFAULT, "SGEkCalendarAdapter addEvent: Skipping donation of event that is extracted from old mail. [SGStorageEvent (%{public}@)]", buf, 0xCu);
                }
                goto LABEL_33;
              }
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (v24) {
            continue;
          }
          break;
        }

        if (!v9)
        {
          self = v36;
          goto LABEL_32;
        }
        id v31 = [v9 isEventComplete];
        char v32 = [v31 BOOLValue];

        self = v36;
        if (v32) {
          goto LABEL_32;
        }
        id v10 = sgEventsLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          long long v33 = [v6 loggingIdentifier];
          *(_DWORD *)buf = 138543362;
          id v48 = v33;
          _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter addEvent: Skipping event that is not complete. [SGStorageEvent (%{public}@)]", buf, 0xCu);
        }
        goto LABEL_12;
      }
      long long v18 = [v6 when];
      double v19 = [v18 absoluteRange];
      [v19 end];
      double v21 = v20;

      if (v14 <= v21) {
        goto LABEL_13;
      }
    }
    char v9 = sgEventsLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 loggingIdentifier];
      *(_DWORD *)buf = 138543362;
      id v48 = v10;
      v11 = "SGEKCalendarAdapter addEvent: Skipping event that has no start time or that has already passed. [SGStorageEv"
            "ent (%{public}@)]";
      goto LABEL_11;
    }
LABEL_33:
  }
}

void __39__SGEKCalendarAdapter_addEvent_commit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _eventsAssociatedWithStorageEvent:*(void *)(a1 + 40) store:v3];
  uint64_t v5 = [*(id *)(a1 + 40) tags];
  id v6 = [MEMORY[0x1E4F5D9F0] naturalLanguageEvent];
  int v7 = [v5 containsObject:v6];

  if (!v7)
  {
LABEL_29:
    if ([v4 count])
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      double v13 = v4;
      uint64_t v32 = [v13 countByEnumeratingWithState:&v56 objects:v68 count:16];
      if (v32)
      {
        uint64_t v34 = v32;
        uint64_t v35 = *(void *)v57;
        *(void *)&long long v33 = 138543362;
        long long v55 = v33;
        while (2)
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v57 != v35) {
              objc_enumerationMutation(v13);
            }
            BOOL v37 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            uint64_t v38 = objc_msgSend(v37, "suggestionInfo", v55, (void)v56);
            if (!v38
              || (id v39 = (void *)v38,
                  [v37 suggestionInfo],
                  id v40 = objc_claimAutoreleasedReturnValue(),
                  [v40 timestamp],
                  double v42 = v41,
                  v40,
                  v39,
                  v42 == 0.0))
            {
              uint64_t v49 = sgEventsLogHandle();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                id v50 = [*(id *)(a1 + 40) loggingIdentifier];
                *(_DWORD *)buf = v55;
                v72 = v50;
                _os_log_impl(&dword_1CA650000, v49, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter addEvent: Skipping event-associated-with-storage-event with missing suggestionInfo. [SGStorageEvent (%{public}@)]", buf, 0xCu);
              }
              goto LABEL_48;
            }
            long long v43 = [v37 suggestionInfo];
            [v43 timestamp];
            double v45 = v44;

            [*(id *)(a1 + 40) creationTimestamp];
            if (v46 <= v45)
            {
              uint64_t v47 = sgEventsLogHandle();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                id v48 = [*(id *)(a1 + 40) loggingIdentifier];
                *(_DWORD *)buf = v55;
                v72 = v48;
                _os_log_impl(&dword_1CA650000, v47, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter addEvent: Skipping event which is not more recent than preexisting EKEvent. [SGStorageEvent (%{public}@)]", buf, 0xCu);
              }
            }
            else
            {
              [*(id *)(a1 + 32) _updateEvent:v37 withValuesFrom:*(void *)(a1 + 40) ekStore:v3];
            }
          }
          uint64_t v34 = [v13 countByEnumeratingWithState:&v56 objects:v68 count:16];
          if (v34) {
            continue;
          }
          break;
        }
      }
LABEL_48:
      id v4 = v13;
    }
    else
    {
      double v13 = [*(id *)(a1 + 40) convertToEvent:*(void *)(a1 + 48)];
      long long v51 = +[SGSuggestHistory sharedSuggestHistory];
      int v52 = [v51 isValidNewEvent:v13];

      if (v52) {
        [*(id *)(a1 + 32) _addEKEventToCalendar:v13 storageEvent:*(void *)(a1 + 40) ekStore:v3 commit:*(unsigned __int8 *)(a1 + 56)];
      }
    }
    goto LABEL_54;
  }
  uint64_t v8 = [*(id *)(a1 + 40) title];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    double v13 = sgEventsLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = [*(id *)(a1 + 40) loggingIdentifier];
      *(_DWORD *)buf = 138543362;
      v72 = v19;
      _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter addEvent: Skipping NLEvent with empty title. [SGStorageEvent (%{public}@)]", buf, 0xCu);
    }
    goto LABEL_54;
  }
  id v10 = [*(id *)(a1 + 40) duplicateKey];
  v11 = [v10 parentKey];
  uint64_t v12 = [v11 entityType];

  if (v12 != 13)
  {
LABEL_20:
    double v13 = objc_opt_new();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v4 = v4;
    uint64_t v24 = [v4 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v61;
      while (2)
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v61 != v26) {
            objc_enumerationMutation(v4);
          }
          double v28 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          uint64_t v29 = [v28 calendar];
          int v30 = [v29 isNaturalLanguageSuggestedEventCalendar];

          if (!v30)
          {
            long long v53 = sgEventsLogHandle();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              long long v54 = [*(id *)(a1 + 40) loggingIdentifier];
              *(_DWORD *)buf = 138543362;
              v72 = v54;
              _os_log_impl(&dword_1CA650000, v53, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter addEvent: Skipping NL Event with associated event in EKEventStore. [SGStorageEvent (%{public}@)]", buf, 0xCu);
            }
            goto LABEL_54;
          }
          [v13 addObject:v28];
        }
        uint64_t v25 = [v4 countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

    uint64_t v31 = [v13 copy];
    id v4 = (id)v31;
    goto LABEL_29;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  double v13 = [*(id *)(a1 + 40) tags];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (!v14)
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v65;
LABEL_6:
  uint64_t v17 = 0;
  while (1)
  {
    if (*(void *)v65 != v16) {
      objc_enumerationMutation(v13);
    }
    long long v18 = *(void **)(*((void *)&v64 + 1) + 8 * v17);
    if ([v18 isNaturalLanguageEventAttributes]) {
      break;
    }
    if (v15 == ++v17)
    {
      uint64_t v15 = [v13 countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v15) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  double v20 = [v18 value];
  char v21 = [v20 longLongValue];

  if ((v21 & 0x20) != 0) {
    goto LABEL_19;
  }
  id v22 = sgEventsLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [*(id *)(a1 + 40) loggingIdentifier];
    *(_DWORD *)buf = 138543362;
    v72 = v23;
    _os_log_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter addEvent: Skipping NLEvent that is not status Confirmed. [SGStorageEvent (%{public}@)]", buf, 0xCu);
  }
LABEL_54:
}

- (void)_runWithEKEventStore:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SGEKCalendarAdapter__runWithEKEventStore___block_invoke;
  v7[3] = &unk_1E65C0440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained runWithWriteLockAcquired:v7];
}

void __44__SGEKCalendarAdapter__runWithEKEventStore___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) result];
  [v2 runWithLockAcquired:*(void *)(a1 + 40)];
}

- (SGEKCalendarAdapter)initWithSGSqlEntityStore:(id)a3 andEKStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SGEKCalendarAdapter;
  id v8 = [(SGEKCalendarAdapter *)&v15 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_store, v6);
    if (v7)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F93B68]);
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v7];
      uint64_t v12 = [v10 initWithResult:v11];
    }
    else
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_42325];
    }
    lazyEKStoreLock = v9->_lazyEKStoreLock;
    v9->_lazyEKStoreLock = (_PASLazyResult *)v12;
  }
  return v9;
}

id __59__SGEKCalendarAdapter_initWithSGSqlEntityStore_andEKStore___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F93B70]);
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F25550], "sg_newStore");
  id v2 = (void *)[v0 initWithGuardedData:v1];

  return v2;
}

- (SGEKCalendarAdapter)initWithSGSqlEntityStore:(id)a3
{
  return [(SGEKCalendarAdapter *)self initWithSGSqlEntityStore:a3 andEKStore:0];
}

@end