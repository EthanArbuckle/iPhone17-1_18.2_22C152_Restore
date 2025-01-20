@interface EKEventStore(Suggestions)
+ (id)sg_newStore;
+ (void)sg_usingSharedStoreForReadingOnly:()Suggestions;
- (double)eventsPerWeekAroundDate:()Suggestions;
- (id)_sg_fetchEKEventsForPseudoNLEvent:()Suggestions title:participants:;
- (id)eventWithExternalID:()Suggestions;
- (id)eventsWithSameAlternativeOpaqueKeyAsDuplicateKey:()Suggestions harvestStore:;
- (id)eventsWithSameAlternativeOpaqueKeyAsPseudoEvent:()Suggestions harvestStore:;
- (id)eventsWithSameAlternativeOpaqueKeyAsStorageEvent:()Suggestions harvestStore:;
- (id)eventsWithSameOpaqueKeyAsDuplicateKey:()Suggestions extraKey:harvestStore:;
- (id)eventsWithSameOpaqueKeyAsPseudoEvent:()Suggestions harvestStore:;
- (id)eventsWithSameOpaqueKeyAsStorageEvent:()Suggestions harvestStore:;
- (id)sg_confirmedEKEventForSGEvent:()Suggestions;
- (id)sg_fetchEKEventsForPseudoEventBySimilarTitleAndStartTime:()Suggestions;
- (id)sg_fetchEKEventsForPseudoNLEvent:()Suggestions entity:;
- (id)sg_fetchEKEventsForPseudoNLEvent:()Suggestions message:;
- (void)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction:()Suggestions;
@end

@implementation EKEventStore(Suggestions)

+ (id)sg_newStore
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F25550]) initWithEKOptions:128];
  return v0;
}

- (double)eventsPerWeekAroundDate:()Suggestions
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  uint64_t v5 = *MEMORY[0x1E4F1C318];
  id v6 = a3;
  v7 = [v4 calendarWithIdentifier:v5];
  id v16 = 0;
  double v17 = 0.0;
  [v7 rangeOfUnit:0x2000 startDate:&v16 interval:&v17 forDate:v6];

  id v8 = v16;
  v9 = [v8 dateByAddingTimeInterval:v17 * -2.0];
  v10 = [v8 dateByAddingTimeInterval:v17 * 3.0 + -1.0];

  v11 = [a1 predicateForEventsWithStartDate:v9 endDate:v10 calendars:0];
  v12 = [a1 eventsMatchingPredicate:v11];
  v13 = sgMapAndFilter();

  double v14 = (double)(unint64_t)[v13 count] / 5.0;
  return v14;
}

- (void)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction:()Suggestions
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isNaturalLanguageEvent])
  {
    if (sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__once != -1) {
      dispatch_once(&sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__once, &__block_literal_global_33_34046);
    }
    [(id)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__lock lock];
    if (sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__ttlCache)
    {
      uint64_t v5 = [(id)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__ttlCache first];
      id v6 = [v4 opaqueKey];
      if ([v5 isEqualToString:v6])
      {
        v7 = [(id)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__ttlCache second];
        [v7 timeIntervalSinceNow];
        double v9 = v8;

        if (v9 > 3300.0)
        {
LABEL_22:
          [(id)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__lock unlock];
          goto LABEL_23;
        }
      }
      else
      {
      }
    }
    v10 = [v4 opaqueKey];
    v11 = [a1 predicateForEventCreatedFromSuggestionWithOpaqueKey:v10];

    v12 = [a1 eventsMatchingPredicate:v11];
    v13 = sgFilter();

    double v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v26 = [v13 count];
      v27 = [v4 opaqueKey];
      *(_DWORD *)buf = 134218242;
      uint64_t v31 = v26;
      __int16 v32 = 2112;
      id v33 = v27;
      _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "Found %lu events to bump TTL on for OpaqueKey: %@", buf, 0x16u);
    }
    if ([v13 count] == 1)
    {
      v15 = [v13 firstObject];
      id v16 = objc_opt_new();
      double v17 = [v16 dateByAddingTimeInterval:3600.0];

      [v15 setLocalCustomObject:v17 forKey:*MEMORY[0x1E4F25450]];
      id v29 = 0;
      char v18 = [a1 saveEvent:v15 span:0 commit:1 error:&v29];
      id v19 = v29;
      v20 = sgLogHandle();
      v21 = v20;
      if (v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEBUG, "EKEventStore+Suggestions: bumped TTL for NL Event ZKW", buf, 2u);
        }

        id v22 = objc_alloc(MEMORY[0x1E4F93BB8]);
        v23 = [v4 opaqueKey];
        uint64_t v24 = [v22 initWithFirst:v23 second:v17];
        v25 = (void *)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__ttlCache;
        sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__ttlCache = v24;
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v31 = (uint64_t)v19;
          _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "Unable to save event in event store: %@", buf, 0xCu);
        }

        v23 = sgLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v28 = [v15 description];
          *(_DWORD *)buf = 138412546;
          uint64_t v31 = (uint64_t)v28;
          __int16 v32 = 2112;
          id v33 = v19;
          _os_log_debug_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEBUG, "Unable to save event in event store; description: %@, error: %@",
            buf,
            0x16u);
        }
      }
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (id)sg_fetchEKEventsForPseudoNLEvent:()Suggestions message:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v11 = [v10 allRecipients];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [*(id *)(*((void *)&v47 + 1) + 8 * i) emailAddress];
          [v9 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v13);
    }

    double v17 = [v10 from];
    char v18 = [v17 emailAddress];

    if (v18)
    {
      id v19 = [v10 from];
      v20 = [v19 emailAddress];
      [v9 addObject:v20];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = a1;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v41 = v8;
      v21 = [v41 recipients];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v44 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            v27 = [v26 handles];
            uint64_t v28 = [v27 count];

            if (v28)
            {
              id v29 = [v26 handles];
              v30 = [v29 objectAtIndexedSubscript:0];
              [v9 addObject:v30];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v23);
      }

      uint64_t v31 = [v41 sender];
      __int16 v32 = [v31 handles];
      uint64_t v33 = [v32 count];

      if (v33)
      {
        uint64_t v34 = [v41 sender];
        v35 = [v34 handles];
        v36 = [v35 objectAtIndexedSubscript:0];
        [v9 addObject:v36];
      }
      a1 = v42;
    }
    else
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2, a1, @"EKEventStore+Suggestions.m", 274, @"Unhandled message class %@", objc_opt_class() object file lineNumber description];
    }
  }
  v38 = [v8 subject];
  v39 = objc_msgSend(a1, "_sg_fetchEKEventsForPseudoNLEvent:title:participants:", v7, v38, v9);

  return v39;
}

- (id)sg_fetchEKEventsForPseudoNLEvent:()Suggestions entity:
{
  id v6 = a3;
  id v7 = [a4 title];
  id v8 = objc_msgSend(a1, "_sg_fetchEKEventsForPseudoNLEvent:title:participants:", v6, v7, 0);

  return v8;
}

- (id)_sg_fetchEKEventsForPseudoNLEvent:()Suggestions title:participants:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 tags];
  uint64_t v12 = [MEMORY[0x1E4F5D9F0] naturalLanguageEvent];
  int v13 = [v11 containsObject:v12];

  if (v13)
  {
    uint64_t v14 = [v8 timeRange];
    v15 = [v14 absoluteRange];
    [v15 start];
    double v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v16];

    char v18 = [v8 timeRange];
    id v19 = [v18 absoluteRange];
    [v19 end];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v20];

    uint64_t v22 = [v17 dateByAddingTimeInterval:-60.0];
    uint64_t v23 = [v21 dateByAddingTimeInterval:60.0];
    uint64_t v24 = [a1 predicateForEventsWithStartDate:v22 endDate:v23 calendars:0];

    v25 = [v8 title];
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    id v41 = __Block_byref_object_copy__34061;
    v42 = __Block_byref_object_dispose__34062;
    id v43 = 0;
    id v43 = (id)objc_opt_new();
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    __int16 v32 = __82__EKEventStore_Suggestions___sg_fetchEKEventsForPseudoNLEvent_title_participants___block_invoke;
    uint64_t v33 = &unk_1E65BC260;
    id v26 = v25;
    id v34 = v26;
    id v35 = v9;
    id v36 = v10;
    v37 = &v38;
    [a1 enumerateEventsMatchingPredicate:v24 usingBlock:&v30];
    if (objc_msgSend((id)v39[5], "count", v30, v31, v32, v33)) {
      v27 = (void *)v39[5];
    }
    else {
      v27 = 0;
    }
    id v28 = v27;

    _Block_object_dispose(&v38, 8);
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

- (id)sg_fetchEKEventsForPseudoEventBySimilarTitleAndStartTime:()Suggestions
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__34061;
  int v13 = __Block_byref_object_dispose__34062;
  id v14 = 0;
  id v14 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__EKEventStore_Suggestions__sg_fetchEKEventsForPseudoEventBySimilarTitleAndStartTime___block_invoke;
  v8[3] = &unk_1E65BC238;
  v8[4] = &v9;
  +[SGDeduper enumerateEKEventsForPseudoEventBySimilarStartAndEndTime:v4 store:a1 usingBlock:v8];
  if ([(id)v10[5] count]) {
    uint64_t v5 = (void *)v10[5];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)eventWithExternalID:()Suggestions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 length])
  {
    [a1 calendarItemsWithExternalIdentifier:v5];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v7 = v10;
            goto LABEL_14;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)eventsWithSameAlternativeOpaqueKeyAsDuplicateKey:()Suggestions harvestStore:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 pseudoEventKey];
  uint64_t v5 = [v4 alternativeKeysForEventKitQuery];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
LABEL_3:
    uint64_t v11 = 0;
    long long v12 = v9;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      long long v13 = objc_msgSend(a1, "predicateForEventCreatedFromSuggestionWithOpaqueKey:", *(void *)(*((void *)&v18 + 1) + 8 * v11), (void)v18);
      uint64_t v9 = [a1 eventsMatchingPredicate:v13];

      uint64_t v14 = [v9 count];
      if (v14) {
        break;
      }
      ++v11;
      long long v12 = v9;
      if (v8 == v11)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  if (v9) {
    long long v15 = v9;
  }
  else {
    long long v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v16 = v15;

  return v16;
}

- (id)eventsWithSameAlternativeOpaqueKeyAsStorageEvent:()Suggestions harvestStore:
{
  id v6 = a4;
  uint64_t v7 = [a3 duplicateKey];
  uint64_t v8 = [a1 eventsWithSameAlternativeOpaqueKeyAsDuplicateKey:v7 harvestStore:v6];

  return v8;
}

- (id)eventsWithSameAlternativeOpaqueKeyAsPseudoEvent:()Suggestions harvestStore:
{
  id v6 = a4;
  uint64_t v7 = [a3 duplicateKey];
  uint64_t v8 = [a1 eventsWithSameAlternativeOpaqueKeyAsDuplicateKey:v7 harvestStore:v6];

  return v8;
}

- (id)eventsWithSameOpaqueKeyAsDuplicateKey:()Suggestions extraKey:harvestStore:
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 pseudoEventKey];
  long long v12 = [v11 keyForEventKitQuery];
  long long v13 = [a1 predicateForEventCreatedFromSuggestionWithOpaqueKey:v12];

  uint64_t v14 = [a1 eventsMatchingPredicate:v13];
  long long v15 = (void *)v14;
  id v16 = (void *)MEMORY[0x1E4F1CBF0];
  if (v14) {
    uint64_t v17 = (void *)v14;
  }
  else {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v18 = v17;

  if (v9)
  {
    long long v19 = [v9 keyForEventKitQuery];
    long long v20 = [a1 predicateForEventCreatedFromSuggestionWithOpaqueKey:v19];

    uint64_t v21 = [a1 eventsMatchingPredicate:v20];
    uint64_t v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = (void *)v21;
    }
    else {
      uint64_t v23 = v16;
    }
    id v24 = v23;

    v25 = [v18 arrayByAddingObjectsFromArray:v24];

    if (![v25 count])
    {
      v56 = v25;
      id v26 = (void *)MEMORY[0x1E4F5D9F0];
      v27 = [v8 pseudoEventKey];
      id v28 = [v27 groupId];
      uint64_t v29 = [v26 extraKey:v28];

      v63[0] = v29;
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
      uint64_t v31 = [v10 duplicateKeysMatchingAnyTag:v30];

      v55 = (void *)v29;
      __int16 v32 = [v31 objectForKeyedSubscript:v29];
      if (v32)
      {
        v51 = v31;
        id v52 = v24;
        id v53 = v10;
        id v54 = v9;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v50 = v32;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v58 objects:v62 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v59;
          v37 = (void *)MEMORY[0x1E4F1CBF0];
          while (2)
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v59 != v36) {
                objc_enumerationMutation(v33);
              }
              v39 = *(void **)(*((void *)&v58 + 1) + 8 * i);
              if ([v39 entityType] == 2 && (objc_msgSend(v39, "isEqualToDuplicateKey:", v8) & 1) == 0)
              {
                id v40 = v8;
                id v41 = [v39 pseudoEventKey];
                v42 = [v41 keyForEventKitQuery];

                uint64_t v43 = [a1 predicateForEventCreatedFromSuggestionWithOpaqueKey:v42];

                uint64_t v44 = [a1 eventsMatchingPredicate:v43];
                long long v45 = (void *)v44;
                if (v44) {
                  long long v46 = (void *)v44;
                }
                else {
                  long long v46 = v37;
                }
                id v47 = v46;

                if ([v47 count])
                {
                  long long v48 = sgLogHandle();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_debug_impl(&dword_1CA650000, v48, OS_LOG_TYPE_DEBUG, "Found related EKEvent by db lookup of related keys.", buf, 2u);
                  }

                  long long v20 = (void *)v43;
                  v56 = v47;
                  id v8 = v40;
                  goto LABEL_28;
                }

                long long v20 = (void *)v43;
                v56 = v47;
                id v8 = v40;
                v37 = (void *)MEMORY[0x1E4F1CBF0];
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v58 objects:v62 count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }
LABEL_28:

        id v10 = v53;
        id v9 = v54;
        uint64_t v31 = v51;
        id v24 = v52;
        __int16 v32 = v50;
      }

      v25 = v56;
    }

    long long v13 = v20;
    id v18 = v25;
  }

  return v18;
}

- (id)eventsWithSameOpaqueKeyAsStorageEvent:()Suggestions harvestStore:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 extraKeyTag];
  if (v8)
  {
    id v9 = [SGPseudoEventKey alloc];
    id v10 = [v6 extraKeyTag];
    uint64_t v11 = [v10 value];
    long long v12 = [(SGPseudoEventKey *)v9 initWithGloballyUniqueId:v11];
  }
  else
  {
    long long v12 = 0;
  }

  long long v13 = [v6 duplicateKey];
  uint64_t v14 = [a1 eventsWithSameOpaqueKeyAsDuplicateKey:v13 extraKey:v12 harvestStore:v7];

  return v14;
}

- (id)eventsWithSameOpaqueKeyAsPseudoEvent:()Suggestions harvestStore:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 extraKeyTag];
  if (v8)
  {
    id v9 = [SGPseudoEventKey alloc];
    id v10 = [v6 extraKeyTag];
    uint64_t v11 = [v10 value];
    long long v12 = [(SGPseudoEventKey *)v9 initWithGloballyUniqueId:v11];
  }
  else
  {
    long long v12 = 0;
  }

  long long v13 = [v6 duplicateKey];
  uint64_t v14 = [a1 eventsWithSameOpaqueKeyAsDuplicateKey:v13 extraKey:v12 harvestStore:v7];

  return v14;
}

- (id)sg_confirmedEKEventForSGEvent:()Suggestions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v4 = [v25 opaqueKey];
  uint64_t v5 = [a1 predicateForEventCreatedFromSuggestionWithOpaqueKey:v4];

  uint64_t v6 = [a1 eventsMatchingPredicate:v5];
  id v7 = (void *)v6;
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    id v8 = (void *)v6;
  }
  id v9 = v8;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v9;
  id v11 = (id)[v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v11) {
    goto LABEL_18;
  }
  id v24 = v5;
  uint64_t v12 = *(void *)v28;
  while (2)
  {
    long long v13 = 0;
    id v26 = v11;
    do
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v13);
      long long v15 = [v14 calendar];
      if ([v15 isSuggestedEventCalendar]) {
        goto LABEL_11;
      }
      id v16 = [v14 calendar];
      if ([v16 isNaturalLanguageSuggestedEventCalendar])
      {

LABEL_11:
        goto LABEL_13;
      }
      [v14 suggestionInfo];
      uint64_t v17 = v12;
      v19 = id v18 = v10;
      long long v20 = [v19 uniqueKey];
      uint64_t v21 = [v25 uniqueKey];
      char v22 = [v20 isEqualToString:v21];

      id v10 = v18;
      uint64_t v12 = v17;
      id v11 = v26;

      if (v22)
      {
        id v11 = v14;
        goto LABEL_17;
      }
LABEL_13:
      long long v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    id v11 = (id)[v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_17:
  uint64_t v5 = v24;
LABEL_18:

  return v11;
}

+ (void)sg_usingSharedStoreForReadingOnly:()Suggestions
{
  uint64_t v5 = a3;
  if (sg_usingSharedStoreForReadingOnly___pasOnceToken3 != -1) {
    dispatch_once(&sg_usingSharedStoreForReadingOnly___pasOnceToken3, &__block_literal_global_34071);
  }
  v3 = [(id)sg_usingSharedStoreForReadingOnly___pasExprOnceResult result];
  id v4 = (void *)MEMORY[0x1CB79B230]();
  v5[2](v5, v3);
}

@end