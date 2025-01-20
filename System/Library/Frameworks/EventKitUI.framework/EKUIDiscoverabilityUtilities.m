@interface EKUIDiscoverabilityUtilities
+ (void)scanEventsForDiscoveredConferencesIfNeeded:(id)a3;
+ (void)sendDiscoverabilitySignalForConference:(id)a3;
@end

@implementation EKUIDiscoverabilityUtilities

+ (void)sendDiscoverabilitySignalForConference:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([MEMORY[0x1E4F57700] currentProcessIsFirstPartyApp])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v4 = objc_msgSend(v3, "joinMethods", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v20;
      v7 = @"facetime";
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)MEMORY[0x1E4F576A0];
        v10 = [*(id *)(*((void *)&v19 + 1) + 8 * v8) URL];
        LOBYTE(v9) = [v9 isTUConversationLink:v10];

        if (v9) {
          break;
        }
        if (v5 == ++v8)
        {
          uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v34 count:16];
          if (v5) {
            goto LABEL_4;
          }
          v7 = @"other";
          break;
        }
      }
    }
    else
    {
      v7 = @"other";
    }

    v32 = @"type";
    v33 = v7;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v12 = (void *)getBMStreamsClass_softClass;
    uint64_t v31 = getBMStreamsClass_softClass;
    if (!getBMStreamsClass_softClass)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __getBMStreamsClass_block_invoke;
      v26 = &unk_1E6087D90;
      v27 = &v28;
      __getBMStreamsClass_block_invoke((uint64_t)&v23);
      v12 = (void *)v29[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v28, 8);
    v14 = [v13 discoverabilitySignal];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v15 = (void *)getBMDiscoverabilitySignalEventClass_softClass;
    uint64_t v31 = getBMDiscoverabilitySignalEventClass_softClass;
    if (!getBMDiscoverabilitySignalEventClass_softClass)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __getBMDiscoverabilitySignalEventClass_block_invoke;
      v26 = &unk_1E6087D90;
      v27 = &v28;
      __getBMDiscoverabilitySignalEventClass_block_invoke((uint64_t)&v23);
      v15 = (void *)v29[3];
    }
    v16 = v15;
    _Block_object_dispose(&v28, 8);
    v17 = (void *)[[v16 alloc] initWithIdentifier:@"com.apple.mobilecal.virtual-conference-added" bundleID:@"com.apple.mobilecal" context:0 userInfo:v11];
    v18 = [v14 source];
    [v18 sendEvent:v17];
  }
}

+ (void)scanEventsForDiscoveredConferencesIfNeeded:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F57700] currentProcessIsFirstPartyApp])
  {
    uint64_t v5 = [MEMORY[0x1E4F57C00] sharedPreferences];
    int v6 = [v5 scanForDiscoveredVirtualConferences];

    if (v6)
    {
      id v28 = a1;
      id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v9 = [MEMORY[0x1E4F1C9C8] date];
      v10 = [v8 components:28 fromDate:v9];

      [v7 setDay:1];
      [v7 setMonth:6];
      [v7 setYear:2021];
      objc_msgSend(v10, "setYear:", objc_msgSend(v10, "year") + 1);
      v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v27 = [v11 dateFromComponents:v7];

      v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v26 = [v12 dateFromComponents:v10];

      id v13 = [v4 sourcesEnabledForEntityType:0];
      v14 = [MEMORY[0x1E4F1CA48] array];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v34 != v18) {
              objc_enumerationMutation(v15);
            }
            long long v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (objc_msgSend(v20, "sourceType", v26) != 5 && objc_msgSend(v20, "sourceType") != 4)
            {
              long long v21 = [v20 calendarsForEntityType:0];
              long long v22 = [v21 allObjects];

              [v14 addObjectsFromArray:v22];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v17);
      }

      uint64_t v23 = [v4 predicateForEventsWithStartDate:v27 endDate:v26 calendars:v14 loadDefaultProperties:1];
      uint64_t v24 = dispatch_get_global_queue(-32768, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__EKUIDiscoverabilityUtilities_scanEventsForDiscoveredConferencesIfNeeded___block_invoke;
      block[3] = &unk_1E6089500;
      id v30 = v4;
      id v31 = v23;
      id v32 = v28;
      id v25 = v23;
      dispatch_async(v24, block);
    }
  }
}

void __75__EKUIDiscoverabilityUtilities_scanEventsForDiscoveredConferencesIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) eventsMatchingPredicate:*(void *)(a1 + 40)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v8 = [v7 virtualConference];
        if (v8)
        {
          v9 = (void *)v8;
          int v10 = [v7 isSelfOrganized];

          if (v10)
          {
            v11 = *(void **)(a1 + 48);
            v12 = [v7 virtualConference];
            [v11 sendDiscoverabilitySignalForConference:v12];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  if ([v2 count])
  {
    id v13 = [MEMORY[0x1E4F57C00] sharedPreferences];
    [v13 setScanForDiscoveredVirtualConferences:0];
  }
}

@end