@interface CDSpotlightItemRecorder
@end

@implementation CDSpotlightItemRecorder

void __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_775(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained) {
    v4 = (void *)*((void *)WeakRetained + 18);
  }
  else {
    v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = 0;
  id v7 = v4;
  uint64_t v8 = [v7 deleteInteractionsWithBundleId:v5 domainIdentifiers:v6 error:&v11];
  id v9 = v11;

  if (v9)
  {
    v10 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_775_cold_1();
    }
  }
  +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 1, *(void **)(a1 + 32), v8);
}

BOOL __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = !v3 || ([*(id *)(a1 + 32) containsDomain:v3] & 1) == 0;

  return v4;
}

void __84___CDSpotlightItemRecorder_addInteractions_bundleID_protectionClass_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"intent.cd_saveToKnowledgeStore = YES"];
  BOOL v4 = [v2 filteredArrayUsingPredicate:v3];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    unint64_t v9 = 0x1E560C000uLL;
    uint64_t v31 = v1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "intent", v31);
        v13 = [v12 _className];

        uint64_t v14 = *(void *)(v1 + 40);
        if (v13 && v14)
        {
          v15 = [getRESiriActionsDonationsWhitelistClass() sharedInstance];
          v16 = v15;
          if (v15) {
            uint64_t v17 = [v15 intentIsWhitelistedForBundleID:*(void *)(v1 + 40) andTypeName:v13];
          }
          else {
            uint64_t v17 = 0;
          }

          uint64_t v14 = *(void *)(v1 + 40);
        }
        else
        {
          uint64_t v17 = 0;
        }
        v18 = [*(id *)(v9 + 3168) eventWithInteraction:v11 bundleIdentifier:v14 storeKeyImage:v17];
        if (v18 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v19 = *(void *)(v1 + 40);
          [v18 UUID];
          uint64_t v20 = v7;
          unint64_t v21 = v9;
          uint64_t v22 = v8;
          v24 = v23 = v5;
          v25 = [v11 performSelector:sel_contextMetadataWithBundleIdentifier_eventUUID_ withObject:v19 withObject:v24];

          v26 = [v18 UUID];
          [v32 setObject:v25 forKeyedSubscript:v26];

          uint64_t v5 = v23;
          uint64_t v8 = v22;
          unint64_t v9 = v21;
          uint64_t v7 = v20;
          uint64_t v1 = v31;
          [v5 addObject:v18];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    _CDCollectDonationMetricsForEventsInDomain(v5, @"intents");
    v27 = v5;
    uint64_t v28 = *(void *)(v1 + 48);
    unsigned int v29 = *(_DWORD *)(*(void *)(*(void *)(v1 + 64) + 8) + 24);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __84___CDSpotlightItemRecorder_addInteractions_bundleID_protectionClass_withCompletion___block_invoke_2;
    v34[3] = &unk_1E5610BA8;
    id v35 = v32;
    id v36 = *(id *)(v1 + 56);
    uint64_t v30 = v28;
    uint64_t v5 = v27;
    -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:](v30, v27, v29, 0, v34);
  }
}

void __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke(uint64_t a1)
{
  v2 = (void *)os_transaction_create();
  uint64_t v3 = a1 + 32;
  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    uint64_t v4 = MEMORY[0x1E4F143A8];
    uint64_t v5 = (id *)(a1 + 40);
    do
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__28;
      v16 = __Block_byref_object_dispose__28;
      id v17 = 0;
      uint64_t v6 = *(void **)v3;
      uint64_t v7 = *(NSObject **)(*(void *)v3 + 24);
      v9[0] = v4;
      v9[1] = 3221225472;
      v9[2] = __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_662;
      v9[3] = &unk_1E560EBD8;
      id v10 = v6;
      id v11 = &v12;
      dispatch_sync(v7, v9);
      id WeakRetained = objc_loadWeakRetained(v5);
      -[_CDSpotlightItemRecorder runOperation:]((uint64_t)WeakRetained, (void *)v13[5]);

      _Block_object_dispose(&v12, 8);
    }
    while ([*(id *)(*(void *)v3 + 32) count]);
  }
  if (![*(id *)(*(void *)v3 + 32) count]
    && *(void *)(*(void *)v3 + 40)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_cold_1(v3);
  }
}

void __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_662(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) firstObject];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectAtIndex:0];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v7)
  {
    uint64_t v9 = v7 + 16;
    uint64_t v7 = *(void *)(v7 + 16);
    uint64_t v8 = *(void *)(v9 + 8);
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"type == %d AND bundleID == %@", v8, v7];
  id v11 = [*(id *)(*(void *)(a1 + 32) + 32) filteredArrayUsingPredicate:v10];
  if (v11)
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v12) {
      v13 = *(void **)(v12 + 8);
    }
    else {
      v13 = 0;
    }
    uint64_t v14 = (void *)[v13 mutableCopy];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v39;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v38 + 1) + 8 * v19);
          if (v20) {
            uint64_t v21 = *(void *)(v20 + 8);
          }
          else {
            uint64_t v21 = 0;
          }
          [v14 addObjectsFromArray:v21];
          ++v19;
        }
        while (v17 != v19);
        uint64_t v22 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
        uint64_t v17 = v22;
      }
      while (v22);
    }

    v23 = objc_alloc_init(_CDSpotlightItemRecorderOperation);
    uint64_t v24 = (uint64_t)v23;
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v25)
    {
      int64_t v26 = *(void *)(v25 + 24);
      if (!v23)
      {
LABEL_20:
        if (v25) {
          v27 = *(void **)(v25 + 16);
        }
        else {
          v27 = 0;
        }
        -[_DKSyncWindow setStartDate:]((uint64_t)v23, v27);
        -[_DKPredictionTimeline setStartDate:](v24, v14);
        uint64_t v28 = *(void **)(*(void *)(a1 + 32) + 32);
        unsigned int v29 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v10];
        uint64_t v30 = [v28 filteredArrayUsingPredicate:v29];
        uint64_t v31 = [v30 mutableCopy];
        uint64_t v32 = *(void *)(a1 + 32);
        v33 = *(void **)(v32 + 32);
        *(void *)(v32 + 32) = v31;

        uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 8);
        id v35 = *(void **)(v34 + 40);
        *(void *)(v34 + 40) = v24;

        goto LABEL_23;
      }
    }
    else
    {
      int64_t v26 = 0;
      if (!v23) {
        goto LABEL_20;
      }
    }
    v23->_type = v26;
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    goto LABEL_20;
  }
LABEL_23:
  id v36 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v36) {
    id v36 = (void *)v36[1];
  }
  long long v37 = v36;
  *(void *)(*(void *)(a1 + 32) + 40) -= [v37 count];
}

void __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_670(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 64);
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_2;
    uint64_t v9 = &unk_1E5610AE8;
    id v10 = v3;
    id v11 = 0;
    id v5 = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:&v6];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "removeObjectsForKeys:", 0, v6, v7, v8, v9);
  }
}

void __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [a3 lastRecorded];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  if (v8 > 30.0) {
    [*(id *)(a1 + 40) addObject:v9];
  }
}

void __46___CDSpotlightItemRecorder__enqueueOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 48))
  {
    uint64_t v3 = os_transaction_create();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 32) addObject:*(void *)(a1 + 40)];
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6) {
    uint64_t v6 = (void *)v6[1];
  }
  double v7 = v6;
  *(void *)(*(void *)(a1 + 32) + 40) += [v7 count];

  double v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  dispatch_source_merge_data(v8, 1uLL);
}

unint64_t __44___CDSpotlightItemRecorder_submitOperation___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  unint64_t v3 = *(void *)(v2 + 40);
  unint64_t v4 = [*(id *)(v2 + 32) count];
  id v5 = (void *)a1[5];
  if (v5) {
    id v5 = (void *)v5[1];
  }
  if (v3 <= v4) {
    unint64_t v3 = v4;
  }
  unint64_t result = [v5 count];
  if (result <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = result;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v7 + v3 > 0x19;
  return result;
}

void __44___CDSpotlightItemRecorder_submitOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_CDSpotlightItemRecorder runOperation:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
}

void __70___CDSpotlightItemRecorder__addOrUpdateCoreDuetInteractions_bundleID___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  unint64_t v3 = [v13 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (!v3)
  {
    uint64_t v4 = 50;
    unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:50];
    do
    {
      id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v3 addObject:v5];

      --v4;
    }
    while (v4);
    if ([v13 count] == 10) {
      [v13 removeAllObjects];
    }
    [v13 setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  unint64_t v6 = [*(id *)(a1 + 40) count];
  if (v6 >= 0x32) {
    uint64_t v7 = 50;
  }
  else {
    uint64_t v7 = v6;
  }
  objc_msgSend(v3, "removeObjectsInRange:", 0, v7);
  for (; v7; --v7)
    [v3 addObject:*(void *)(a1 + 48)];
  double v8 = *(void **)(a1 + 48);
  id v9 = [v3 objectAtIndexedSubscript:0];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;

  BOOL v12 = v11 < 0.0 || v11 > 100.0;
  if (!v12 && (IOPSDrawingUnlimitedPower() & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

BOOL __70___CDSpotlightItemRecorder__addOrUpdateCoreDuetInteractions_bundleID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  unint64_t v3 = [a2 startDate];
  if (v3)
  {
    [v2 timeIntervalSinceDate:v3];
    double v5 = v4;
  }
  else
  {
    unint64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v2 timeIntervalSinceDate:v6];
    double v5 = v7;
  }
  return v5 < 300.0;
}

uint64_t __90___CDSpotlightItemRecorder_saveRateLimitedEvents_donatorUid_responseQueue_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __90___CDSpotlightItemRecorder_saveRateLimitedEvents_donatorUid_responseQueue_withCompletion___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

void __61___CDSpotlightItemRecorder_donateRelevantShortcuts_bundleID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    double v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61___CDSpotlightItemRecorder_donateRelevantShortcuts_bundleID___block_invoke_cold_1();
    }
  }
}

void __84___CDSpotlightItemRecorder_addInteractions_bundleID_protectionClass_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = [get_CDContextQueriesClass() keyPathForIntentsDataDictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(a1 + 32);
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "UUID", (void)v18);
        id v15 = [v13 objectForKeyedSubscript:v14];

        if (v15)
        {
          uint64_t v16 = [get_CDClientContextClass() userContext];
          [v16 setObject:v15 forKeyedSubscript:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, BOOL, id))(v17 + 16))(v17, v8 != 0, v6);
  }
}

BOOL __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 domainIdentifier];
  BOOL v4 = !v3 || ([*(id *)(a1 + 32) containsDomain:v3] & 1) == 0;

  return v4;
}

void __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke_761(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = +[_DKEvent eventWithSearchableItem:v8 bundleIdentifier:*(void *)(a1 + 40)];
        uint64_t v10 = (void *)v9;
        if (v9) {
          uint64_t v9 = [v2 addObject:v9];
        }
        uint64_t v11 = (void *)MEMORY[0x192FB2F20](v9);
        uint64_t v12 = +[_DKEvent eventRepresentingUserActivityWithSearchableItem:v8 bundleIdentifier:*(void *)(a1 + 40)];
        if (v12) {
          [v2 addObject:v12];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    unsigned int v13 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke_2;
    v15[3] = &unk_1E560DE28;
    uint64_t v14 = *(void *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:](v14, v2, v13, 0, v15);
  }
}

void __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = a1;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v19 = a3;
  uint64_t v5 = [get_CDContextQueriesClass() keyPathForUserActivityDataDictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "metadata", v18);
        uint64_t v12 = +[_DKApplicationActivityMetadataKey userActivityRequiredString];
        unsigned int v13 = [v11 objectForKeyedSubscript:v12];

        if (v13)
        {
          uint64_t v14 = [get_CDContextQueriesClass() userActivityRequiredString];
          uint64_t v24 = v14;
          uint64_t v25 = v13;
          id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];

          id v16 = [get_CDClientContextClass() userContext];
          [v16 setObject:v15 forKeyedSubscript:v5];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }

  uint64_t v17 = *(void *)(v18 + 32);
  if (v17) {
    (*(void (**)(uint64_t, BOOL, id))(v17 + 16))(v17, v6 != 0, v19);
  }
}

void __66___CDSpotlightItemRecorder_addUserAction_withItem_withCompletion___block_invoke(uint64_t a1)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v3 = [*(id *)(a1 + 48) stream];
    id v4 = [v3 name];
    uint64_t v5 = +[_DKSystemEventStreams appLocationActivityStream];
    id v6 = [v5 name];
    int v7 = [v4 isEqualToString:v6];

    if (v7) {
      uint64_t v8 = 15;
    }
    else {
      uint64_t v8 = 5;
    }
    uint64_t v9 = [_CDMultiLevelRateLimiter alloc];
    v15[0] = &unk_1EDE1E1E0;
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v8];
    v15[1] = &unk_1EDE1E1F8;
    v16[0] = v10;
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:30];
    v16[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    uint64_t v2 = [(_CDMultiLevelRateLimiter *)v9 initWithPeriodToCountMap:v12];

    unsigned int v13 = *(void **)(*(void *)(a1 + 32) + 64);
    uint64_t v14 = [*(id *)(a1 + 56) bundleID];
    [v13 setObject:v2 forKeyedSubscript:v14];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [(_CDMultiLevelRateLimiter *)v2 debited];
}

void __66___CDSpotlightItemRecorder_addUserAction_withItem_withCompletion___block_invoke_771(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 count])
  {
    id v6 = +[_CDSpotlightItemUtils contextDictionaryForSearchableItem:*(void *)(a1 + 32) userAction:*(void *)(a1 + 40)];
    int v7 = [get_CDContextQueriesClass() keyPathForUserActivityDataDictionary];
    uint64_t v8 = [get_CDClientContextClass() userContext];
    [v8 setObject:v6 forKeyedSubscript:v7];
  }
  if (a2)
  {
    uint64_t v9 = [*(id *)(a1 + 32) bundleID];
    +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 2, v9, 1);
  }
  else
  {
    uint64_t v10 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke_cold_1();
    }
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, BOOL, id))(v11 + 16))(v11, a2 != 0, v5);
  }
}

uint64_t __84___CDSpotlightItemRecorder__deleteUserActivitiesWithPersistentIdentifiers_bundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 112);
  id v4 = a2;
  id v5 = +[_DKSource spotlightSourceID];
  uint64_t v6 = [v3 containsObjectForSourceID:v5 bundleID:*(void *)(a1 + 40) itemID:v4];

  return v6;
}

uint64_t __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 104) computeHashesForString:a2 reuse:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 104);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v6 getWithHashes:v7];
}

void __83___CDSpotlightItemRecorder_deleteSearchableItemsSinceDate_bundleID_withCompletion___block_invoke(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"startDate >= CAST(%f,\"NSDate\")", *(void *)(a1 + 32));
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleId == %@", *(void *)(a1 + 40)];
  uint64_t v4 = (void *)MEMORY[0x1E4F28BA0];
  v14[0] = v2;
  v14[1] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v6 = [v4 andPredicateWithSubpredicates:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = WeakRetained;
  if (WeakRetained) {
    uint64_t v9 = (void *)*((void *)WeakRetained + 18);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = (objc_class *)NSString;
  id v11 = v9;
  uint64_t v12 = (void *)[[v10 alloc] initWithFormat:@"deleteSearchableItemsSinceDate:%@ bundleID:%@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  uint64_t v13 = [v11 deleteInteractionsMatchingPredicate:v6 sortDescriptors:MEMORY[0x1E4F1CBF0] limit:0 debuggingReason:v12 error:0];

  +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 1, *(void **)(a1 + 40), v13);
}

void __66___CDSpotlightItemRecorder_deleteAllItemsWithBundleID_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = (void *)WeakRetained[18];
  }
  uint64_t v4 = [WeakRetained deleteInteractionsWithBundleId:*(void *)(a1 + 32) error:0];

  id v5 = *(void **)(a1 + 32);
  +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 1, v5, v4);
}

void __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)a1 + 40);
  int v2 = 134217984;
  uint64_t v3 = v1;
  _os_log_fault_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "expected _pendingOperationsItemCount to be 0, but was %td", (uint8_t *)&v2, 0xCu);
}

void __61___CDSpotlightItemRecorder_donateRelevantShortcuts_bundleID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error saving relevant shortcuts events to knowledge store: %@", v2, v3, v4, v5, v6);
}

void __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_775_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error encountered deleteSearchableItemsWithDomainIdentifiers:bundleID: %@", v2, v3, v4, v5, v6);
}

@end